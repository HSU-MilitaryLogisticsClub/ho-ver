require "move" --GPIOを使用するためのもの
require "receive_shell" --シェル関数でファイルからデータを取るもの
require "sleep" --いわゆる wait を使うためのもの

main = {
	LuaGpio:ReadyGpio()
	get = {}
}

function main.Catch(self)
	self.get = Receive:ReadShell()
	a=1	

	repeat

		while true do	
			if self.get[a]==1 then --luaの列は1から数える
				while self.get[a]==1
					self.LuaGpio:Left(1)
					a++
					wait(0.1)

					self.LuaGpio:Right(2)
					break
				end
			end

			else
				self.LuaGpio:Left(2)
			end

			wait(0.1)
			a++
		end

		LuaGpio:Forward(3)
		LuaGpio:Stop()

	until get[a-1]==0
end