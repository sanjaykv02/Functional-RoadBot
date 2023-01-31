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



#---------------------------------Servo--Control--------------------------------------
  defp drop(speed) do
    #Logger.debug("Testing Servo Motor a ")
    Logger.remove_backend(:console)
    pid = ServoKit.init_standard_servo()
    ServoKit.set_angle(pid, 0, 70)       # args(pid, channel, angle in degrees)
    Process.sleep(round(speed*1000))
    ServoKit.set_angle(pid, 0, 180)     # args(pid, channel, angle in degrees)
    Process.sleep(round(speed*1000))
    Logger.add_backend(:console)
  end

  def dispense(count) when count > 0 do
    drop(1)
    dispense(count - 1)
  end
  def dispense(count) when count ==0 do
    IO.puts "All RCMs Dispensed"
  end
end
