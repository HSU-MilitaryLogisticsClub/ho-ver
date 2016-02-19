require "receive_shell"

function i2cTest()
	now = os.time()
	while timeCount == 10 do
		Receive.CallShell()
		timeCount = now - os.time
	end
end

i2cTest()
