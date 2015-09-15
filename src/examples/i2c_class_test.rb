
require "./I2C.rb"


sleadd = 0x6a
power_enable = 0x20
setval = 0x0f

class L3GD20 < I2C

  def avetimes time , ave
    sleadd = 0x6a
    bunnkainou = 0.00875
    data1 = 0
    data2 = 0
    data3 = 0
    ave.times do
      data1 = data1 + i2c_get_L3GD20(sleadd,  0x29)
      data2 = data2 + i2c_get_L3GD20(sleadd,  0x2B)
      data3 = data3 + i2c_get_L3GD20(sleadd,  0x2D)
    end
    print (Time.now - time)
    print ","
    print ((data1/ave)*bunnkainou)
    print ","
    print ((data2/ave)*bunnkainou)
    print ","
    puts ((data3/ave)*bunnkainou)
  end

  def i2c_get_L3GD20(sle_adr , mem_adr)
    h = `sudo i2cget -y #{@bus_adr} #{ sle_adr} #{mem_adr}`
    l = `sudo i2cget -y #{@bus_adr} #{ sle_adr} #{mem_adr - 1}`
    return signed_word2d(str_word2d h ,l).  to_i
  end
end

sc = L3GD20.new(1)

sc.i2c_init(sleadd,power_enable,setval)

time = Time.now
30.times do
  sc.avetimes(time,2)
end
