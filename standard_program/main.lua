require "move"
require "receive_shell"

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
					self.LuaGpio:Left(2)
					a++
				end

				self.LuaGpio:Right(4)
				break

			end

			else
				self.LuaGpio:Left(2)
			end

			a++
		end

		LuaGpio:Forward(3)
		LuaGpio:Stop()

	until get[1]==0
end