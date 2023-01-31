defmodule Line_Follower do
@moduledoc """
  A client module implementing line following logic for Alphabot
  """
  require Logger
  use Bitwise
  alias Pigpiox.{GPIO, Pwm}

  @level [high: 1, low: 0, on: 1, off: 0]


# Refer Pin_Conig notes for i/o device control

  @buzzer_pin [buz: 4]
  @sensor_pins [cs: 5, clock: 25, address: 24, dataout: 23]
  @ir_pins [dr: 16, dl: 19]
  @motor_pins [lf: 12, lb: 13, rf: 20, rb: 21]
  @pwm_pins [left: 6, right: 26]

  @ref_atoms [:cs, :clock, :address, :dataout]
  @lf_sensor_data %{sensor0: 0, sensor1: 0, sensor2: 0, sensor3: 0, sensor4: 0, sensor5: 0}
  @lf_sensor_map %{0 => :sensor0, 1 => :sensor1, 2 => :sensor2, 3 => :sensor3, 4 => :sensor4, 5 => :sensor5}

  @motion_list [forward:  [0, 1, 0, 1],
                backward: [1, 0, 1, 0],
                left:     [0, 1, 1, 0],
                right:    [1, 0, 0, 1],
                stop:     [0, 0, 0, 0]]

  @duty_cycle 100
  @pwm_frequency 50

#--------------------------------B-U-Z-Z-E-R-----------------------------------

  @doc """
     blow_buzzer is the function used to indicate that
     bot have finished the line follower task.
     """

  def blow_buzzer do
#   Logger.debug("Blowing Buzzer")
    buzzer_init()
    buzzer_control(:high)
    Process.sleep(6000)
    buzzer_control(:low)
  end

  def buzzer_init do
    GPIO.set_mode(@buzzer_pin[:buz], :output)
  end

  @doc """
  Controls the status of buzzer by giving any of the following agrument:
  [:high, :low, :on, :off]
  Example:
    iex> FB_HardwareTesting.buzzer_control(:high)
    :ok
    """

  def buzzer_control(status) do
    GPIO.write(@buzzer_pin[:buz], @level[status])
  end

#-----------------------------M-O-T-I-O-N-----------------------------------

  @doc """
       motion_init initialize the motion for the bot.
       """
  def motion_init do
    Enum.map(@motor_pins, fn {_atom, pin_no} -> GPIO.set_mode(pin_no, :output) end)
    motor_action(:stop)
    Enum.each(@pwm_pins, fn {_atom, pin_no} -> Pwm.gpio_pwm(pin_no, @duty_cycle) end)
  end

  @doc """
  Sets the direction of motors by giving any of the following agrument:
  [:forward, :backward, :left, :right, :stop]
  Example:
    iex> FB_HardwareTesting.motor_action(:forward)
    :ok
  """
  def motor_action(motion) do
    @motor_pins |> Enum.zip(@motion_list[motion]) |> Enum.each(fn {{_atom, pin_no}, value} -> GPIO.write(pin_no, value) end)
  end

#----------------------------------S-P-E-E-D------------------------------------

  @doc """
  Speed function is used to control speed of motor. Value can be vary from 0 to 100 
  """
  def speed(value) do
    IO.puts("Forward with pwm value = #{round(value*2.55)}")
    pwm(:left, value)
    pwm(:right, value)
    Process.sleep(100)
  end

  @doc """
  Note: "motor" can take any one value from following: [:left, :right] and
  "duty" variable can take value from 0 to 255. Value 255 indicates 100% duty cycle
  Example:
    iex> FB_HardwareTesting.pwm(:left, 100)
    :ok
  """

  defp pwm(motor, duty) do
    Pwm.gpio_pwm(@pwm_pins[motor], duty)
  end

#-------------------------------White---Line---Sensor----------------------------


  @doc """
  Tests white line sensor modules reading
  Example:
      iex> FB_HardwareTesting.test_wlf_sensors
      [958, 851, 969, 975, 943]  // on white surface
      [449, 356, 312, 321, 267]  // on black surface
  """

  def test_wlf_sensors do
    Logger.debug("Testing white line sensors connected ")
    sensor_ref = Enum.map(@sensor_pins, fn {atom, pin_no} -> configure_sensor({atom, pin_no}) end)
    sensor_ref = Enum.map(sensor_ref, fn{_atom, ref_id} -> ref_id end)
    sensor_ref = Enum.zip(@ref_atoms, sensor_ref)
    get_lfa_readings([0,1,2,3,4], sensor_ref)
  end

  @doc """
  Supporting function for test_wlf_sensors
  Configures sensor pins as input or output
  [cs: output, clock: output, address: output, dataout: input]
  """

  defp configure_sensor({atom, pin_no}) do
    if (atom == :dataout) do
      Circuits.GPIO.open(pin_no, :input, pull_mode: :pullup)
    else
      Circuits.GPIO.open(pin_no, :output)
    end
  end

  @doc """
  Supporting function for test_wlf_sensors
  Reads the sensor values into an array. "sensor_list" is used to provide list
  of the sesnors for which readings are needed
  The values returned are a measure of the reflectance in abstract units,
  with higher values corresponding to lower reflectance (e.g. a black
  surface or void)
  """

  defp get_lfa_readings(sensor_list, sensor_ref) do
    append_sensor_list = sensor_list ++ [5]
    temp_sensor_list = [5 | append_sensor_list]
    [_ | sensor_data] = append_sensor_list
        |> Enum.with_index
        |> Enum.map(fn {sens_num, sens_idx} ->
              analog_read(sens_num, sensor_ref, Enum.fetch(temp_sensor_list, sens_idx))
              end)
    Enum.each(0..5, fn n -> provide_clock(sensor_ref) end)
    Circuits.GPIO.write(sensor_ref[:cs], 1)
    Process.sleep(250)
    sensor_data
  end

  @doc """
  Supporting function for test_wlf_sensors
  """

  defp analog_read(sens_num, sensor_ref, {_, sensor_atom_num}) do

    Circuits.GPIO.write(sensor_ref[:cs], 0)
    %{^sensor_atom_num => sensor_atom} = @lf_sensor_map
    Enum.reduce(0..9, @lf_sensor_data, fn n, acc ->
                                          read_data(n, acc, sens_num, sensor_ref, sensor_atom_num)
                                          |> clock_signal(n, sensor_ref)
                                        end)[sensor_atom]
  end
  

  @doc """
  Supporting function for test_wlf_sensors
  """

  defp read_data(n, acc, sens_num, sensor_ref, sensor_atom_num) do
    if (n < 4) do

      if (((sens_num) >>> (3 - n)) &&& 0x01) == 1 do
        Circuits.GPIO.write(sensor_ref[:address], 1)
      else
        Circuits.GPIO.write(sensor_ref[:address], 0)
      end
      Process.sleep(1)
    end

    %{^sensor_atom_num => sensor_atom} = @lf_sensor_map
    if (n <= 9) do
      Map.update!(acc, sensor_atom, fn sensor_atom -> ( sensor_atom <<< 1 ||| Circuits.GPIO.read(sensor_ref[:dataout]) ) end)
    end
  end

  @doc """
  Supporting function for test_wlf_sensors used for providing clock pulses
  """

  defp provide_clock(sensor_ref) do
    Circuits.GPIO.write(sensor_ref[:clock], 1)
    Circuits.GPIO.write(sensor_ref[:clock], 0)
  end

  @doc """
  Supporting function for test_wlf_sensors used for providing clock pulses
  """

  defp clock_signal(acc, n, sensor_ref) do
    Circuits.GPIO.write(sensor_ref[:clock], 1)
    Circuits.GPIO.write(sensor_ref[:clock], 0)
    acc
  end
#------------------------------Line-------Follower--------------------------------

  def fw(sp, t) do
    speed(sp)
    motor_action(:forward)
    :timer.sleep(t*1000)
    stop
  end

  def bw(sp, t) do
    speed(sp)
    motor_action(:backward)
    :timer.sleep(t*1000)
    stop
  end
#Sharp Left
  def left_pos do
    speed(30)
    motor_action(:left)
  end
#Sharp Right
  def right_pos do
    speed(30)
    motor_action(:right)
  end

  def stop, do:
    motor_action(:stop)
#Sharp U-Turn
  def turn_around do
    speed(30)
    motor_action(:left)
    :timer.sleep(10)
    stop
  end


  def my_func do
    IO.inspect test_wlf_sensors
    [sl,l,c,r,sr] = test_wlf_sensors
    if sl < 920 and sr < 890 and c >= 930 and (r < 890 or l < 890) do
      IO.puts "Forward"
      motor_action :forward
      speed 40
    end
    if sl < 920 and c >= 930 and r >= 910 and sr >= 910 do
      IO.puts "Right"
      right_pos
    end
    if sl >= 940 and l >= 910 and c >= 930 and sr < 890 do
      IO.puts "Left"
      left_pos
    end    
    if (sl < 920 and l >= 910) or (sl >= 940 and l < 890) do
      IO.puts "Adjust Right"
      motor_action :left
      speed 25
      motor_action :forward
      speed 40
    end
    if (sr < 890 and r >= 910) or (sr >= 910 and r < 890) do
      IO.puts "Adjust Left"
      motor_action :right
      speed 25
      motor_action :forward
      speed 40
    end
    if sr > 910 and r> 910 and c > 930 and l > 910 and sl > 940 do
      IO.puts "Stop"
      motor_action :stop
    end
    my_func
  end

  def continue_test(val) when val > 0 do
    IO.inspect test_wlf_sensors
    :timer.sleep(200)
    continue_test(val - 1)
  end

  def continue_test(val)  when val == 0 do
    :ok
  end

  def test do
    speed 30
    motor_action :left
    :timer.sleep 100
    motor_action :forward
    speed 40
    :timer.sleep 2000
    speed 0
  end
































  def main() do
    {:ok, pid} = Task4c.LineFollower.start_link()
    #{:ok, #PID<0.180.0>}
    feedback = Task4c.LineFollower.state_checker(pid)
    #[0, 0, 0, 0, 0]
    success = Task4c.LineFollower.lfa_updater(pid)
    #:ok
    feedback = Task4c.LineFollower.state_checker(pid)
    #[134, 124, 156, 653, 735]
    IO.inspect(feedback, label: "Feedback")

    feedback = Task4c.LineFollower.state_checker(pid)
    #[134, 124, 156, 653, 735]
    IO.inspect(feedback, label: "Feedback")
  end

end
