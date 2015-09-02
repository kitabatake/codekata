# Roughly how many binary digits
def roughly_required_bit (num)
  Math.log2(num).ceil.to_s
end

puts "1,000 => " + roughly_required_bit(1000)
puts "1,000,000 => " + roughly_required_bit(10**6)
puts "1,000,000,000 => " + roughly_required_bit(10**9)
puts "1,000,000,000,000 => " + roughly_required_bit(10**12)
puts "8,000,000,000,000 => " + roughly_required_bit(8 * (10**12))

# How much space is required to store the my town residences(20,000) data.
# I assumed 1 characters required space is 2byte.
# Following assumed each item average length and required space.
#  - name: avg length = 10, bit = 160
#  - address: avg length = 50, bit = 800
#  - phone number: avg length = 11, bit 176
#
# Hence 1 residences required average space is 1,136 bits.
# It can be represented approximately 1k bits.
# So the space that stored my town residences data is 1k * 20,000 = 20m bits = 2,5 MB.


# Roughly how many nodes and levels can expected binary tree (100,000 integers) have?
# nodes = 100,000
# levels = log2 100,000 .. 100,000
#
# Roughly how much space will it occupy on a 32-bit architecture?
# Folloing I assumed 1 node required space
#  - integer value, 20 bits
#  - parent node address, 32 bits
#  - children nodes addresses, 64 bits
#
# Hence 1 node required space is 116 bits
# Total required space is 116M bits = 1,45 MB