require "receive_shell"

function i2cTest()
	Receive.WriteDate()
	print("write today's date")
	now = os.time()
	while timeCount == 10 do
		Receive.CallShell()
		timeCount = os.time - now 
		print(timeCount)
	end
	print("write censor's data")
end

i2cTest()
