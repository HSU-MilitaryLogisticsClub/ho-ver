GPIO=require "GPIO"

LuaGpio = {
leftmotor={12, 20}, --select RaspberryPi's GPIO pin to move left motor
rightmotor={16, 21}, --select RaspberryPi's GPIO pin to move right motor
ReadyGpio = function()
GPIO.setmode(GPIO.BCM)
GPIO.setup(LuaGpio.leftmotor[1], GPIO.OUT)
GPIO.setup(LuaGpio.leftmotor[2], GPIO.OUT)
GPIO.setup(LuaGpio.rightmotor[1], GPIO.OUT)
GPIO.setup(LuaGpio.rightmotor[2], GPIO.OUT)
end
}
function LuaGpio.Forward(ftime)
f = os.time() --
ftime = ftime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
until ((os.time() - f) >= ftime)
end
function LuaGpio.Back(btime)
b = os.time() --
btime = btime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
until os.time() - b >= btime
end
function LuaGpio.Left(ltime)
l = os.time() --
ltime = ltime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
until os.time() - l >= ltime
end
function LuaGpio.Right(rtime)
r = os.time() --
rtime = rtime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
until os.time() - r >= rtime
end
function LuaGpio.Stop()
GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
GPIO.cleanup()  --format GPIO's pin number
end