require "move"

function TestGpio()
	LuaGpio:ReadyGpio()
	LuaGpio.Forward(3)
	LuaGpio.Stop()
	os.execute("sleep 1s")
--[[
	LuaGpio.Back(3)
	LuaGpio:Stop()
	os.execute("sleep 1s")

	LuaGpio.Left(3)
	LuaGpio.Stop()
	os.execute("sleep 1s")

	LuaGpio.Right(3)
	LuaGpio.Stop()
	os.execute("sleep 1s")
]]
end

TestGpio()
