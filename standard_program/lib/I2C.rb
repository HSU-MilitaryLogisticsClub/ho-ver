#coding: utf-8
#!/usr/bin/ruby

class I2C
  def initialize badr
    @bus_adr = badr
  end
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
      return (d2h div) + (dec2hex_private   dec)
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
    return (byte2d (hex2dec sbin[2]),(  hex2dec sbin[3]) )
  end
  
  def str_word2d sh ,sl
    return ((str_byte_hex2d sh) * 256) + ( str_byte_hex2d sl)
  end

  # i2c
  def i2c_init(sle_adr , mem_adr ,set_val)
  `sudo i2cset -y #{@bus_adr} #{sle_adr} #{mem_adr} #{set_val} i`
  end
  
  def i2c_get(sle_adr , mem_adr)
    return `sudo i2cget -y #{@bus_adr} #{ sle_adr} #{mem_adr}`.to_i
  end

  def i2c_get2(sle_adr , mem_adr)
    h = `sudo i2cget -y #{@bus_adr} #{ sle_adr} #{mem_adr}`
    l = `sudo i2cget -y #{@bus_adr} #{ sle_adr} #{mem_adr + 1}`
    return signed_word2d(str_word2d h ,l).  to_i
  end
end
