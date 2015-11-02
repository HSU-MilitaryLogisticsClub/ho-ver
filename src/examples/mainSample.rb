require "./I2C.rb"

bus_address         = 1
sle_address         = 0x53
# data_format         = 0x31
power_ctl           = 0x2D
# range_16g           = 0x03
measure             = 0x08
x_address           = 0x32
# scale_multiplier    = 0.004 # 2g , 3.3V
ave                 = 1

sleadd2 = 0x6b
power_enable = 0x20
setval = 0x0f
bunnkainou = 0.00875
xadd2 = 0x28

def mult(xyz)
  out = []
  xyz.each do |x|
    out.push(x * 0.004 * 9.80665)
  end
  return out
end

def mult2(xyz)
  out = []
  xyz.each do |x|
    out.push(x * 0.00875)
  end
  return out
end

def execute(sleep_sec)
  yield
  sleep sleep_sec
end

adxl345 = I2C.new(bus_address,0x53)
l3gd20 = I2C.new(bus_address,0x6b)

adxl345.i2c_set(power_ctl, measure)
l3gd20.i2c_set(power_enable, setval) # これやるとだめになる

time = Time.now

60.times do
  execute(0.75) do ||
    # puts l3gd20.averageB(xadd2,ave)
    # puts ([Time.now - time] + mult(adxl345.averageB(x_address,ave)) ).join(',')
    # puts mult2([l3gd20.trans(l3gd20.i2c_get(0x29) + l3gd20.i2c_get(0x28)),l3gd20.trans(l3gd20.i2c_get(0x2b) + l3gd20.i2c_get(0x2a)),l3gd20.trans(l3gd20.i2c_get(0x2d) + l3gd20.i2c_get(0x2c))])
    puts ([Time.now - time] + mult(adxl345.averageB(x_address,ave)) + mult2([l3gd20.trans(l3gd20.i2c_get(0x29) + l3gd20.i2c_get(0x28)),l3gd20.trans(l3gd20.i2c_get(0x2b) + l3gd20.i2c_get(0x2a)),l3gd20.trans(l3gd20.i2c_get(0x2d) + l3gd20.i2c_get(0x2c))])).join(',')
  end
end