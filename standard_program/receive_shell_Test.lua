shell = require "receive_shell"

os.execute([[
			touch hoge.sh
			echo x=5 y=6 z=4 > hoge.sh
			]])

open = Receive:ReadShell()
assert(open,5,6,4)

print("Test is succeed!")
--open = Receive.new("test")
--open:ReadShell()
--assert(open:ReadShell(),"a",5)

-- finish --