require "receive"

f = io.open("hoge.sh","a+")
open = Receive.read("hoge")

f:write("5")
assert(open,5)

f:write("6")
assert(open,6)


print("Test1 is succeed!")
f:close()