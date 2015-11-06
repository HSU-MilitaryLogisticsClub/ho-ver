require "move" --GPIOを使用するためのもの
require "receive_shell" --シェルファイルからデータを取るもの
require "sleep" --いわゆる wait を使うためのもの

main = {
	LuaGpio:ReadyGpio(),
	get = {},
	self.call1 = Receive.CallShell(1),
	self.call2 = Receive.CallShell(),
	self.get = Receive.ReadShell(1),
	self.open1 = io.open("hoge.sh","a"),
	self.open2 = io.open("hogehoge.sh","a")
}

function main.Catch(self)
	a = 2

	self.call2
	wait(0.1)
	self.open2
	io.write(os.data().." Start!")
	io.close()
	wait(0.1)

	self.open1
	io.write(os.data().." Start!")
	io.close()
	wait(0.1)
	self.call1
	wait(0.1)

	for i=1,3 do
		while self.get[a] == 0 do
			LuaGpio.Left(2)
			wait(0.1)
			self.call1
			wait(0.1)
			a++
		end

		LuaGpio.Forward(5)
		wait(0.1)

		self.call1
		self.open1
		io.write(os.data()..string.format(" %s週目",i))
		io.close()
		wait(0.1)
		a = a+2

		self.call2
		self.open2
		io.write(os.data()..string.format(" %s週目",i))
		io.close()
		wait(0.1)
	end

	self.open1
	io.write(os.data().." Finish!")
	io.close()
	wait(0.1)

	self.open2
	io.write(os.data().." Finish!")
	io.close()
	wait(0.1)
end
