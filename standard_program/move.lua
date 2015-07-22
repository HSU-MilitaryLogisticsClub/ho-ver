GPIO=require "GPIO"

LuaGpio = {
	leftmotor={12, 20},  --select RaspberryPi's GPIO pin to move left motor
	rightmotor={16, 21},  --select RaspberryPi's GPIO pin to move right motor
<<<<<<< HEAD
	GPIO.setmode(GPIO.BCM),
	GPIO.setup(leftmotor[1], GPIO.OUT),
	GPIO.setup(leftmotor[2], GPIO.OUT),
	GPIO.setup(rightmotor[1], GPIO.OUT),
	GPIO.setup(rightmotor[2], GPIO.OUT)
=======
	ReadyGpio = function(self)
		GPIO.setmode(GPIO.BCM)
		GPIO.setup(LuaGpio.leftmotor[1], GPIO.OUT)
		GPIO.setup(LuaGpio.leftmotor[2], GPIO.OUT)
		GPIO.setup(LuaGpio.rightmotor[1], GPIO.OUT)
		GPIO.setup(LuaGpio.rightmotor[2], GPIO.OUT)
	end
>>>>>>> 4076b72705b45c2e0feb5e35402811bb18f74b4f
}

	function LuaGpio.Forward(self,ftime)
		f = os.time() --
		self.ftime = ftime
		repeat
<<<<<<< HEAD
			GPIO.output(leftmotor[1], GPIO.HIGH)
			GPIO.output(leftmotor[2], GPIO.LOW)
			GPIO.output(rightmotor[1], GPIO.HIGH)
			GPIO.output(rightmotor[2], GPIO.LOW)
			until os.time() - f >= self.ftime
=======
			GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
			GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
			GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
			GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
		until ((os.time() - f) >= self.ftime)
>>>>>>> 4076b72705b45c2e0feb5e35402811bb18f74b4f
	end

	function LuaGpio.Back(self,btime)
		b = os.time() --
		self.btime = btime
		repeat
<<<<<<< HEAD
			GPIO.output(leftmotor[1], GPIO.LOW)
			GPIO.output(leftmotor[2], GPIO.HIGH)
			GPIO.output(rightmotor[1], GPIO.LOW)
			GPIO.output(rightmotor[2], GPIO.HIGH)
=======
			GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
			GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
			GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
			GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
>>>>>>> 4076b72705b45c2e0feb5e35402811bb18f74b4f
			until os.time() - b >= self.btime
	end

	function LuaGpio.Left(self,ltime)
		l = os.time() --
		self.ltime = ltime
		repeat
<<<<<<< HEAD
			GPIO.output(leftmotor[1], GPIO.LOW)
			GPIO.output(leftmotor[2], GPIO.HIGH)
			GPIO.output(rightmotor[1], GPIO.HIGH)
			GPIO.output(rightmotor[2], GPIO.LOW)
=======
			GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
			GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
			GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
			GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
>>>>>>> 4076b72705b45c2e0feb5e35402811bb18f74b4f
			until os.time() - l >= self.ltime
	end

	function LuaGpio.Right(self,rtime)
		r = os.time() --
		self.rtime = rtime
		repeat
<<<<<<< HEAD
			GPIO.output(leftmotor[1], GPIO.HIGH)
			GPIO.output(leftmotor[2], GPIO.LOW)
			GPIO.output(rightmotor[1], GPIO.LOW)
			GPIO.output(rightmotor[2], GPIO.HIGH)
=======
			GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
			GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
			GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
			GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
>>>>>>> 4076b72705b45c2e0feb5e35402811bb18f74b4f
			until os.time() - r >= self.rtime
	end

	function LuaGpio.Stop()
<<<<<<< HEAD
		GPIO.output(leftmotor[1], GPIO.LOW)
		GPIO.output(leftmotor[2], GPIO.LOW)
		GPIO.output(rightmotor[1], GPIO.LOW)
		GPIO.output(rightmotor[2], GPIO.LOW)
=======
		GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
>>>>>>> 4076b72705b45c2e0feb5e35402811bb18f74b4f
	end