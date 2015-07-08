shell = require "receive_shell"

TestBegin = {
	print(_[[
		mkdir test.sh
		ex1 = "a"
		ex2 = 5
		]])
	end
}

function TestBegin.TestRead()
	assert(ReadShell("test"),"a",5)
end

TestRead().run()