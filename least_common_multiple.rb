# Least Common Multiple
# ------------------------------------------------------------------------------
# Define a method, #lcm, that accept two integers as arguments. The method should
# return the least common multiple of the two integers.
#
# Example of a multiple: 12 is a multiple of 4 because 12 is evenly
# divisible by 4.

# The common multiples of 2 and 3 include: 6, 12, 18.. and the smallest of these multiples
# is 6. Hence, the least common multiple of 2 and 3 is 6.
#
# the least common multiple of 2 and 3 is 6
# the least common multiple of 6 and 10 is 30
# it is NOT ALWAYS the product of the inputs
# lcm(6, 10) => 30
#
# the lcm for equal numbers is that number
# lcm(50, 50) => 50
#
# NOTE: do not use the integer method lcm; that is, do not call a.lcm(b).

def lcm(a, b)
  #
  # your code goes here
  # create two empty arrays to accumulate mutliples of 'a' and 'b'
  # iterate 1 thru a and 1 thru b getting multiples for 'a' and 'b'
  # select multiples from both arrays if common (*)
  # choose the leat from above (*)
  multiples_of_a, multiples_of_b = [], []

  (1..b).each do |n|
    multiples_of_a << n * a
  end

  (1..a).each do |n|
    multiples_of_b << n * b
  end

  common_multiples = multiples_of_a.select do |multiple|
    multiples_of_b.include?(multiple)
  end

  common_multiples.first
end

puts "-------Least Common Multiple-------"
puts lcm(2, 3) == 6
puts lcm(6, 10) == 30
puts lcm(5, 20) == 20
puts lcm(50, 50) == 50
