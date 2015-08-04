require "move"
require "receive_shell"


main = {
	LuaGpio:ReadyGpio(),
	get = {}
}

function main.Catch(self)

	while true do

		repeat
			LuaGpio:Left(60)
			self.get = Receive:ReadShell()
		until self.get[2]>1 --get[2]：距離を予定

		if self.get[2]<2 then
			LuaGpio:Stop()
			break
		end

		LuaGpio:Left(self.get[1]) --get[1]：相対角度を予定
		LuaGpio:Stop()

		LuaGpio:Forward(self.get[2])
		LuaGpio:Stop()

	end
end

main.run()