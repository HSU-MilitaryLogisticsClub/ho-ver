require "move"
require "receive_shell"

main = {
	LuaGpio:ReadyGpio()
	get = {}
}

function main.Catch(self)
	repeat
		while true do
			LuaGpio:Left(6)
			self.get = Receive:ReadShell()
		
			if get[1]>0, get[2]>0, get[3]>0 do --
				LuaGpio:Stop()
				break
			end
		end

		LuaGpio:Forward(5)
		LuaGpio:Stop()

		until get[1]>0, get[2]>0, get[3]>0
end