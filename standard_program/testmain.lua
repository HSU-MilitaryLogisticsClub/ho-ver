--RaspberryPi 以外の環境下でのテスト用

--require "move" --GPIOを使用するためのもの
require "receive_shell" --シェルファイルからデータを取るもの
require "sleep" --いわゆる wait を使うためのもの

main = {
--	LuaGpio:ReadyGpio(),
--	get = {}
}


function main.Catch()
--	call1 = Receive.CallShell(1)
--	call2 = Receive.CallShell()
--	get = Receive.ReadShell(1)
	open1 = io.open("hoge.txt","a")
	open2 = io.open("hogehoge.txt","a")

--	a = 2

--	open1:write(os.date().." Start!\n")
--	io.close()
--	wait(0.1)
--	call1
	Receive.CallShell(1)
--	wait(0.1)

--	open2:write(os.date().." Start!\n")
--	io.close()
--	wait(0.1)
--	call2
	Receive.CallShell()
	wait(0.3)

	for i=1,3 do
		while Receive.CallShell(1) == 0 do
--			LuaGpio.Left(1)
--			wait(0.1)
--			call1
			Receive.CallShell(1)
			Receive.CallShell()
			wait(0.3)
--			a = a+1
		end

--		LuaGpio.Forward(5)

--		open1:write(os.date()..string.format(" %s週目",i).."\n")
--		io.close()
--		wait(0.1)
--		call1
--		Receive.CallShell(1)
--		wait(0.1)
--		a = a+2
		Receive.CallShell(1)
--		open2
--		open2:write(os.date()..string.format(" %s週目",i).."\n")
--		io.close()
--		wait(0.1)
--		call2
		Receive.CallShell()
		wait(0.3)
	end

--	open1
	open1:write(os.date().." Finish!")
	open1:close()
--	wait(0.1)
	
--	open2
	open2:write(os.date().." Finish!")
	open2:close()
--	wait(0.1)

end



main.Catch()