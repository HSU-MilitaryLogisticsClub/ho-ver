require "receive_shell"

now = os.time()
while timeCount == 10 do
	Receive.CallShell()
	timeCount = now - os.time
end
