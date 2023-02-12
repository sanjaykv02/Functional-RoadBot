defmodule DispenserMechanism do
  @moduledoc """
  Documentation for `DispenserMechanism`.
  This is used to dispense the RCMs in the Deposition
  Containers with the help of Ultrasonic sensor and
  Servo motor.


  Ultrasonic Sensor's Pin Configuration:-->

  Echo:-->27 
  Trig:-->22

  Servo Motor Pin:-->0(I2C)
  
  """
  @motor_pin [mot: 0]
  @sensor_pins [echo: 27, trig: 22]

  require Logger
  use Bitwise
  alias Pigpiox.{GPIO, Pwm}

  @doc """
  Hello world.

  ## Examples

      iex> DispenserMechanism.hello()
      :world

  """
#------------------------------Ultrasonic--as--a--feedback---------------------------
  def detector() do
    #Ultrasonic Code Goes Here
    configure_sensor(:echo)
    configure_sensor(:trig)
    support_for_detector()
  end
  defp support_for_detector do
    
  end

  defp configure_sensor(pin) do
    if pin == :echo do
      Circuits.GPIO.open(pin, :input)
    else 
      Circuits.GPIO.open(pin, :output)
    end
  end

#---------------------------------Servo--Control--------------------------------------
  defp drop(speed) do
    #Logger.debug("Testing Servo Motor a ")
    Logger.remove_backend(:console)
    pid = ServoKit.init_standard_servo()
    ServoKit.set_angle(pid, 0, 100)       # args(pid, channel, angle in degrees)
    Process.sleep(round(speed*1000))
    ServoKit.set_angle(pid, 0, 180)     # args(pid, channel, angle in degrees)
    Process.sleep(round(speed*1000))
    Logger.add_backend(:console)
  end

  @doc """
  This function is used to drop RCMs in the deposition container
  
  ## Example:- 
  
  iex> DispenserMechanism.dispence(positive int) // say 2

  iex> All RCMs Dispensed
  
  // message will display after droping 2 rcms in the box.
  """
  def dispense(count) when count > 0 do
    drop(1)
    dispense(count - 1)
  end
  def dispense(count) when count ==0 do
    Process.sleep(1000)
    IO.puts "All RCMs Dispensed"
  end
end
