require "move"

function TestGpio()
<<<<<<< HEAD
=======
	LuaGpio:ReadyGpio()
>>>>>>> 4076b72705b45c2e0feb5e35402811bb18f74b4f
	LuaGpio:Forward(3)
	LuaGpio:Stop()
	os.execute("sleep 1s")

	LuaGpio:Back(3)
	LuaGpio:Stop()
	os.execute("sleep 1s")

	LuaGpio:Left(3)
	LuaGpio:Stop()
	os.execute("sleep 1s")

	LuaGpio:Right(3)
	LuaGpio:Stop()
	os.execute("sleep 1s")

end

TestGpio()
