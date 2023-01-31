{application,servo_kit,
             [{applications,[kernel,stdlib,elixir,logger,circuits_i2c]},
              {description,"Drive PCA9685 PWM/Servo Controller using Elixir"},
              {modules,['Elixir.ServoKit','Elixir.ServoKit.Application',
                        'Elixir.ServoKit.ContinuousServo',
                        'Elixir.ServoKit.Driver','Elixir.ServoKit.I2C',
                        'Elixir.ServoKit.I2C.Behaviour',
                        'Elixir.ServoKit.PCA9685',
                        'Elixir.ServoKit.PCA9685.Util',
                        'Elixir.ServoKit.ProcessRegistry',
                        'Elixir.ServoKit.Servo',
                        'Elixir.ServoKit.ServoController',
                        'Elixir.ServoKit.ServoSupervisor',
                        'Elixir.ServoKit.ServoUtil',
                        'Elixir.ServoKit.StandardServo']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.ServoKit.Application',[]}}]}.