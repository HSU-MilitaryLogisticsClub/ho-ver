require "move"

function TestGpio()
	LuaGpio.ReadyGpio()

	LuaGpio.Forward(3)
	LuaGpio.Stop(0.1)
	print("Forward")
	os.execute("sleep 1s")

	LuaGpio.Back(3)
	LuaGpio.Stop(0.1)
	print("Back")
	os.execute("sleep 1s")

	LuaGpio.Left(3)
	LuaGpio.Stop(0.1)
	print("Left")
	os.execute("sleep 1s")

	LuaGpio.Right(3)
	LuaGpio.Stop(0.1)
	print("Right")
	os.execute("sleep 1s")

	LuaGpio.Clean()
	print("Finish!")
end

TestGpio()
