shell = require "receive_shell"

--os.execute([[
--			touch hoge.sh
--			echo x=5 y=6 z=4 > hoge.sh
--			touch hogehoge.sh
--			echo "5" > hogehoge.sh
--			]])
function TestWriteDate()
	Receive.WriteDate()
	print("Test start!")
end


function TestHoge()
	for i=1,3 do
		Receive.CallShell(1)
		print(Receive.ReadShell())
		if Receive.ReadShell() == 1 then
			print("True")
		else
			print("False")
		end
	end
	print("Test1 is succeed!")
end


--open = Receive.new("test")
--open:ReadShell()
--assert(open:ReadShell(),"a",5)
function TestHogehoge()
	Receive.CallShell()
	os.execute("cat hogehoge.txt")
	print("Test2 is succeed!")
end

TestWriteDate()
TestHoge()
TestHogehoge()
-- finish --