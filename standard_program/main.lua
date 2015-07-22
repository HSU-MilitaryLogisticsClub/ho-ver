require "move"
require "receive_shell"

main = {}

function main.Catch(self)
	repeat
		LuaGpio:Left(6)
		get = Receive:ReadShell()
		until 

end
