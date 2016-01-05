require "move"

function TestGpio()
	LuaGpio.ReadyGpio()

	LuaGpio.Forward(3)
	LuaGpio.Stop(0.1)
	os.execute("sleep 1s")

	LuaGpio.Back(3)
	LuaGpio.Stop(0.1)
	os.execute("sleep 1s")

	LuaGpio.Left(3)
	LuaGpio.Stop(0.1)
	os.execute("sleep 1s")

	LuaGpio.Right(3)
	LuaGpio.Stop(0.1)
	os.execute("sleep 1s")

	LuaGpio.Clean()
end

TestGpio()
