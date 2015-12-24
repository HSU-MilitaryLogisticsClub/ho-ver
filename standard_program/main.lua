require "move" --GPIOを使用するためのもの
require "receive_shell" --シェルファイルからデータを取るもの
require "sleep" --いわゆる wait を使うためのもの

main = {}

function main.Catch()
	LuaGpio:ReadyGpio()
	Receive.CallShell(1)
	Receive.CallShell()
	print("Setting all right")
	wait(0.3)

	for i=1,3 do
		while Receive.CallShell(1) == 0 do
			LuaGpio.Left(1)
			Receive.CallShell(1)
			print("Seek the object")
			wait(0.3)
		end
		
		print("Find the object")
		LuaGpio.Forward(5)

		Receive.CallShell(1)
		Receive.CallShell()
		wait(0.3)
	end

	open1 = io.open("hoge.txt","a")
	open1:write(os.date().." Finish!")
	open1:close()
	
	open2 = io.open("hogehoge.txt","a")
	open2:write(os.date().." Finish!")
	open2:close()

	LuaGpio.Stop()
	print("All process are finished")
end



main.Catch()
