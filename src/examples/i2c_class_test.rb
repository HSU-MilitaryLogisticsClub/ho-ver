
require "./I2C.rb"

sc = I2C.new()

x = sc.byte2d 15 , 15
y = sc.word2d 0x8f , 0xff
z = sc.signed_word2d ( sc.word2d 0x7f , 0xff )

a = sc.str_byte_hex2d "0xff"
b = sc.str_word2d "0x8f" , "0xff"
c = sc.signed_word2d (sc.str_word2d "0x7f" , "0xff")

puts x
puts y
puts z

puts a
puts b
puts c