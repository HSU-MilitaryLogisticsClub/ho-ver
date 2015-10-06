require "receive"

Receive.read("hoge")
fh = io.open("hoge.sh","r")

data=fh:read("*a")
print(data)

print("test is succeed!")