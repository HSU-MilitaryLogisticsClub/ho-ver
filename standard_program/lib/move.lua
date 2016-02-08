GPIO=require "GPIO"


LuaGpio = {
leftmotor={27, 22}, --select RaspberryPi's GPIO pin to move left motor
rightmotor={6, 5}, --select RaspberryPi's GPIO pin to move right motor
}
--[[
function loop(run,left1,left2,right1,right2)
	now = os.time()
	repeat
		GPIO.output(LuaGpio.leftmotor[1], left1)
		GPIO.output(LuaGpio.leftmotor[2], left2)
		GPIO.output(LuaGpio.rightmotor[1], right1)
		GPIO.output(LuaGpio.rightmotor[2], right2)
	until (os.time() - now) >= run
end
]]

function LuaGpio.ReadyGpio()
	GPIO.setwarnings(False)
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(LuaGpio.leftmotor[1], GPIO.OUT)
	GPIO.setup(LuaGpio.leftmotor[2], GPIO.OUT)
	GPIO.setup(LuaGpio.rightmotor[1], GPIO.OUT)
	GPIO.setup(LuaGpio.rightmotor[2], GPIO.OUT)
end

function LuaGpio.Forward(runtime)
--	loop(runtime,GPIO.HIGH,GPIO.LOW,GPIO.HIGH,GPIO.LOW)
	now = os.time()
	repeat
		GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
		GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
		GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
	until (os.time() - now) >= runtime
end

function LuaGpio.Back(runtime)
--	loop(runtime,GPIO.LOW,GPIO.HIGH,GPIO.LOW,GPIO.HIGH)
	now = os.time()
	repeat
		GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
		GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
	until (os.time() - now) >= runtime
end

function LuaGpio.Left(runtime)
--	loop(runtime,GPIO.HIGH,GPIO.LOW,GPIO.LOW,GPIO.HIGH)
	now = os.time()
	repeat
		GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
		GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
	until (os.time() - now) >= runtime
end

function LuaGpio.Right(runtime)
--	loop(runtime,GPIO.LOW,GPIO.HIGH,GPIO.HIGH,GPIO.LOW)
	now = os.time()
	repeat
		GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
		GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
		GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
	until (os.time() - now) >= runtime
end

function LuaGpio.Stop(runtime)
--	loop(runtime,GPIO.LOW,GPIO.LOW,GPIO.LOW,GPIO.LOW)
	now = os.time()
	repeat
		GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
		GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
	until (os.time() - now) >= runtime
end

function LuaGpio.Clean()
	GPIO.cleanup()  --format GPIO's pin number
end
