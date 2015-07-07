move = require "move"
shell = require "receive_shell"

main = {
	forward() = move.LuaGpio.Forward()
	back() = move.LuaGpio.Back()
	left() = move.LuaGpio.Left()
	right() = move.LuaGpio.Right()
	read() = receive_shell.ReadShell()
}

function main.Moving()
	
end
