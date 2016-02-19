require "receive_shell"

function i2cTest()
	Receive.WriteDate()
	print("write today's date")
	now = os.time()
	while timeCount == 10 do
		Receive.CallShell()
		timeCount = now - os.time
		print(print(timeCount)
	end
	print("write censor's data")
end

i2cTest()
