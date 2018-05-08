# Maybe Zeroes

# You are given an array of numbers, and a boolean.

# Write a method that will remove all the zeroes from the numbers if
# drop is true and then add the numbers with the zeroes removed and
# return this sum. If  drop is false then add the given numbers and
# return the sum.

def maybe_zeroes(numbers, drop)
# your codes goes here
  result = nil
  if drop
    result = helper(numbers)

  else
    result = numbers.reduce(:+)

  end

  result
end

#helper
def helper(arr)
  array = []
  arr.each {|n| array << n.to_s.chars.reject {|z| z == '0'}.join('').to_i}

  array.reduce(:+)
end

puts "-------Maybe Zeroes-------"

puts maybe_zeroes([100, 505, 9, 1002], true) == 77
puts maybe_zeroes([100, 505, 9, 1002], false) == 1616
puts maybe_zeroes([9000103, 43], true) == 956
puts maybe_zeroes([43, 7, 98], false) == 148
