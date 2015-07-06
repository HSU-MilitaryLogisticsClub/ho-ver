GPIO=require "GPIO"

LuaGpio = {
	leftmotor=[15, 16],  --select RaspberryPi's GPIO pin to move left motor
	rightmotor=[17, 22],  --select RaspberryPi's GPIO pin to move right motor
	ReadyGpio = function(self)
		GPIO.setmode(GPIO.BCM)
		GPIO.setup(leftmotor[0], GPIO.OUT)
         GPIO.setup(leftmotor[1], GPIO.OUT)
         GPIO.setup(rightmotor[0], GPIO.OUT)
         GPIO.setup(rightmotor[1], GPIO.OUT)
     end
}

	function LuaGpio.Forward(time)
		f = 0 --
		repeat
			GPIO.output(leftmotor[0], GPIO.HIGH)
			GPIO.output(leftmotor[1], GPIO.LOW)
			GPIO.output(rightmotor[0], GPIO.HIGH)
			GPIO.output(rightmotor[1], GPIO.LOW)
			until f == time
	end

	function LuaGpio.Back(time)
		b = 0 --
		repeat
			GPIO.output(leftmotor[0], GPIO.LOW)
			GPIO.output(leftmotor[1], GPIO.HIGH)
			GPIO.output(rightmotor[0], GPIO.LOW)
			GPIO.output(rightmotor[1], GPIO.HIGH)
			until b == time
	end

	function LuaGpio.Left(time)
		l = 0 --
		repeat
			GPIO.output(leftmotor[0], GPIO.LOW)
			GPIO.output(leftmotor[1], GPIO.HIGH)
			GPIO.output(rightmotor[0], GPIO.HIGH)
			GPIO.output(rightmotor[1], GPIO.LOW)
			until l == time
	end

	function LuaGpio.Right(time)
		r = 0 --
		repeat
			GPIO.output(leftmotor[0], GPIO.HIGH)
			GPIO.output(leftmotor[1], GPIO.LOW)
			GPIO.output(rightmotor[0], GPIO.LOW)
			GPIO.output(rightmotor[1], GPIO.HIGH)
			until r == time
	end

	function LuaGpio.Stop()
		GPIO.output(leftmotor[0], GPIO.LOW)
		GPIO.output(leftmotor[1], GPIO.LOW)
		GPIO.output(rightmotor[0], GPIO.LOW)
		GPIO.output(rightmotor[1], GPIO.LOW)
	end