package.path = "/home/pi/doc/ho-ver/standard_program/lib/?.lua"  --read package flom "lib"
require "move" --GPIOを使用するためのもの
require "receive_shell" --シェルファイルからデータを取るもの
require "sleep" --いわゆる wait を使うためのもの

main = {}

function main.Catch()
	LuaGpio:ReadyGpio()
	Receive.WriteDate()
	Receive.CallShell(1)
	Receive.CallShell()
	print("Setting all right")
	LuaGpio.Stop()
	wait(0.3)

	for i=1,3 do
                
		while Receive.ReadShell() == 0 do
			LuaGpio.Left(1)
			LuaGpio.Stop()
			Receive.CallShell(1)
			print("Seek the object")
			wait(0.3)
		end
		
		print("Find the object")
		LuaGpio.Forward(5)
		LuaGpio.Stop()

		Receive.CallShell(1)
		Receive.CallShell()
		wait(0.3)
	end

	LuaGpio.Stop()
	LuaGpio.Clean()
	print("All process are finished")
end



main.Catch()
