require "write"

Write.text(5)

fh = io.open("hoge.sh","r")

data=fh:read("*a")
print(data)
fh:close()

print("test is succeed!")