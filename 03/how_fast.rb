# How fast Book data send over async 56k modem line?
# Assuming 1 page characters number is 500 and 1 character take 1 byte.
# So Book data total bytes is 500 * 1,200 pages = 6,000bytes = 48,000 bits.
# Hence Answer is 48,000 / 56,000 = 0.857 seconds.

# How fast 10,000,000 elements searching by binary search algorithm
x = 0.0045 / Math.log2(10000)
x2 = 0.006 / Math.log2(100000)

puts "#{x}, #{x2}"

y = x * Math.log2(10**7)
p y

# How fast password hacking

time = 0.001 * (96 ** 16)
days = time / (24 * 60 * 60)
years = days / 365
p years

# it takes 6 * 10 ** 23 days
# it is not viable.
