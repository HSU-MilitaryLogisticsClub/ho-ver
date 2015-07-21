require "move"

function TestGpio()
	LuaGpio:Forward(10)
	LuaGpio:Stop()
	os.execute("sleep 1s")

	LuaGpio:Back(10)
	LuaGpio:Stop()
	os.execute("sleep 1s")

	LuaGpio:Left(10)
	LuaGpio:Stop()
	os.execute("sleep 1s")

	LuaGpio:Right(10)
	LuaGpio:Stop()
	os.execute("sleep 1s")

end

run.TestGpio()