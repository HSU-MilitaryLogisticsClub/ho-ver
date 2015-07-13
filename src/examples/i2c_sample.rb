#coding: utf-8
#!/usr/bin/ruby

# hex dec

def hex2dec hex
  if (hex == "a")
    return 10
  elsif (hex == "b")
    return 11
  elsif (hex == "c")
    return 12
  elsif (hex == "d")
    return 13
  elsif (hex == "e")
    return 14
  elsif (hex == "f")
    return 15
  else
    return hex.to_i
  end
end

def dec2hex_private dec
  mod = dec % (16)
  if (mod == 10)
    return "a"
  elsif (mod == 11)
    return "b"
  elsif (mod == 12)
    return "c"
  elsif (mod == 13)
    return "d"
  elsif (mod == 14)
    return "e"
  elsif (mod == 15)
    return "f"
  else
    return mod.to_s
  end
end

def d2h dec
  div = dec / (16)
  if div >= 1
    return (d2h div) + (dec2hex_private dec)
  else
    return "0x" + (dec2hex_private dec)
  end
end

def byte2d h ,l
  return ((h * 16) + l )
end

def word2d h ,l
  return ( (h * 256) + l )
end

def signed_word2d word_dec
  if (word_dec >= 0x8000)
    return -((65535 - word_dec) + 1)
  else
    return word_dec
  end
end

def str_byte_hex2d sbin
  return (byte2d (hex2dec sbin[2]),(hex2dec sbin[3]) )
end

def str_word2d sh ,sl
  return ((str_byte_hex2d sh) * 256) + (str_byte_hex2d sl)
end

# i2c

def i2c_init(bus_adr , sle_adr , mem_adr ,set_val)
  `sudo i2cset -y #{bus_adr.to_s} #{sle_adr.to_s} #{mem_adr.to_s} #{set_val.to_s} i`
end

def i2c_get(bus_adr , sle_adr , mem_adr)
  h = `sudo i2cget -y #{bus_adr} #{sle_adr} #{mem_adr}`
  l = `sudo i2cget -y #{bus_adr} #{sle_adr} #{mem_adr + 1}`
  return signed_word2d(str_word2d h ,l).to_i
end

# main

x = byte2d 15 , 15
y = word2d 0xff , 0xff
z = signed_word2d ( word2d 0x7f , 0xff )

a = str_byte_hex2d "0xff"
b = str_word2d "0x8f" , "0xff"
c = signed_word2d (str_word2d "0x7f" , "0xff")

puts x
puts y
puts z

puts a
puts b
puts c

# x = (byte2d val_h * 256) + (byte2d val_l)
# puts (x *  0.00875)
# puts (x * 0.0175)
# puts (x * 0.07)
