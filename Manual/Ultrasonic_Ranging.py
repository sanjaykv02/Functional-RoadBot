import RPi.GPIO as GPIO
import time

TRIG = 22
ECHO = 27

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(TRIG,GPIO.OUT,initial=GPIO.LOW)
GPIO.setup(ECHO,GPIO.IN)

def dist():
	GPIO.output(TRIG,GPIO.HIGH)
	time.sleep(0.000015)
	GPIO.output(TRIG,GPIO.LOW)
	while not GPIO.input(ECHO):
		pass
	t1 = time.time()
	while GPIO.input(ECHO):
		pass
	t2 = time.time()
	return (t2-t1)*34000/2

try:
	while True:
		i = 0
		sum = 0
		while i<200:
			sum = sum + dist()
			i = i + 1
			time.sleep(0.004)
		print("Distance:%0.2f cm" %(sum/200))
except KeyboardInterrupt:
	GPIO.cleanup()
