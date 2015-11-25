GPIO=require "GPIO"

LuaGpio = {
GPIO.cleanup(),  --format GPIO's pin number
leftmotor={12, 20}, --select RaspberryPi's GPIO pin to move left motor
rightmotor={16, 21}, --select RaspberryPi's GPIO pin to move right motor
ReadyGpio = function(self)
GPIO.setmode(GPIO.BCM)
GPIO.setup(LuaGpio.leftmotor[1], GPIO.OUT)
GPIO.setup(LuaGpio.leftmotor[2], GPIO.OUT)
GPIO.setup(LuaGpio.rightmotor[1], GPIO.OUT)
GPIO.setup(LuaGpio.rightmotor[2], GPIO.OUT)
end
}
function LuaGpio.Forward(self,ftime)
f = os.time() --
self.ftime = ftime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
until ((os.time() - f) >= self.ftime)
end
function LuaGpio.Back(self,btime)
b = os.time() --
self.btime = btime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
until os.time() - b >= self.btime
end
function LuaGpio.Left(self,ltime)
l = os.time() --
self.ltime = ltime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[2], GPIO.HIGH)
until os.time() - l >= self.ltime
end
function LuaGpio.Right(self,rtime)
r = os.time() --
self.rtime = rtime
repeat
GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.leftmotor[2], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[1], GPIO.HIGH)
GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
until os.time() - r >= self.rtime
end
function LuaGpio.Stop()
GPIO.output(LuaGpio.leftmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.leftmotor[2], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[1], GPIO.LOW)
GPIO.output(LuaGpio.rightmotor[2], GPIO.LOW)
GPIO.cleanup()
end