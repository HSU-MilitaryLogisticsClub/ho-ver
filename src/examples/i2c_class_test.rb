
require "./I2C.rb"

sleadd = 0x6a
power_enable = 0x20
setval = 0x0f
bunnkainou = 0.00875

class L3GD20 < I2C

  def avetimes ave
    sleadd = 0x6a
    bunnkainou = 0.00875
    data1 = 0
    data2 = 0
    data3 = 0
    ave.times do
      data1 = data1 + i2c_get(sleadd,  0x29)
      data2 = data2 + i2c_get(sleadd,  0x2B)
      data3 = data3 + i2c_get(sleadd,  0x2D)
    end
    print ((data1/ave)*bunnkainou)
    print ","
    print ((data2/ave)*bunnkainou)
    print ","
    puts ((data3/ave)*bunnkainou)
  end
end

sc = L3GD20.new(1)

sc.i2c_init(sleadd,power_enable,setval)

30.times do
  sc.avetimes(1)
end