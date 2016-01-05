shell = require "receive_shell"

--os.execute([[
--			touch hoge.sh
--			echo x=5 y=6 z=4 > hoge.sh
--			touch hogehoge.sh
--			echo "5" > hogehoge.sh
--			]])

call = Receive.CallShell(1)
open = Receive.ReadShell(1)
assert(open,5,6,4)
print("Test1 is succeed!")
--open = Receive.new("test")
--open:ReadShell()
--assert(open:ReadShell(),"a",5)
call = Receive.CallShell()
open = Receive.ReadShell()
assert(open,5)
print("Test2 is succeed!")
-- finish --