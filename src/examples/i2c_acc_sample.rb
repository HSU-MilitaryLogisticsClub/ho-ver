
require "./I2C.rb"

bus_address         = 1
sle_address         = 0x53
# data_format         = 0x31
power_ctl           = 0x2D
# range_16g           = 0x03
measure             = 0x08
x_address           = 0x32
scale_multiplier    = 0.004

def avetimes(time , ave)
  puts ([Time.now - time] + averageB(ave)).join(',')
end

adxl345 = I2C.new(bus_address,sle_address)
adxl345.i2c_set(power_ctl, measure)

time = Time.now
30.times do
  cs.avetimes(time,2)