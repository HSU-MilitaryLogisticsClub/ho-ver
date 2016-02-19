require "receive_shell"

function i2cTest()
	count = 0
	Receive.WriteDate()
	print("write today's date")
	while count == 10 do
		Receive.CallShell()
		count = count+1
		print(timeCount)
		os.execute("sleep 0.1s")
	end
	print("write censor's data")
end

i2cTest()
