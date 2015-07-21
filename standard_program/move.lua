GPIO=require "GPIO"

LuaGpio = {
	leftmotor=[12, 20],  --select RaspberryPi's GPIO pin to move left motor
	rightmotor=[16, 21],  --select RaspberryPi's GPIO pin to move right motor
	ReadyGpio = function(self)
		GPIO.setmode(GPIO.BCM)
		GPIO.setup(leftmotor[0], GPIO.OUT)
         GPIO.setup(leftmotor[1], GPIO.OUT)
         GPIO.setup(rightmotor[0], GPIO.OUT)
         GPIO.setup(rightmotor[1], GPIO.OUT)
     end
}

	function LuaGpio.Forward(ftime)
		f = os.time() --
		repeat
			GPIO.output(leftmotor[0], GPIO.HIGH)
			GPIO.output(leftmotor[1], GPIO.LOW)
			GPIO.output(rightmotor[0], GPIO.HIGH)
			GPIO.output(rightmotor[1], GPIO.LOW)
			until os.time() - f >= ftime
	end

	function LuaGpio.Back(btime)
		b = os.time() --
		repeat
			GPIO.output(leftmotor[0], GPIO.LOW)
			GPIO.output(leftmotor[1], GPIO.HIGH)
			GPIO.output(rightmotor[0], GPIO.LOW)
			GPIO.output(rightmotor[1], GPIO.HIGH)
			until os.time() - b >= btime
	end

	function LuaGpio.Left(ltime)
		l = os.time() --
		repeat
			GPIO.output(leftmotor[0], GPIO.LOW)
			GPIO.output(leftmotor[1], GPIO.HIGH)
			GPIO.output(rightmotor[0], GPIO.HIGH)
			GPIO.output(rightmotor[1], GPIO.LOW)
			until os.time() - l >= ltime
	end

	function LuaGpio.Right(rtime)
		r = os.time() --
		repeat
			GPIO.output(leftmotor[0], GPIO.HIGH)
			GPIO.output(leftmotor[1], GPIO.LOW)
			GPIO.output(rightmotor[0], GPIO.LOW)
			GPIO.output(rightmotor[1], GPIO.HIGH)
			until os.time() - r >= rtime
	end

	function LuaGpio.Stop()
		GPIO.output(leftmotor[0], GPIO.LOW)
		GPIO.output(leftmotor[1], GPIO.LOW)
		GPIO.output(rightmotor[0], GPIO.LOW)
		GPIO.output(rightmotor[1], GPIO.LOW)
	end