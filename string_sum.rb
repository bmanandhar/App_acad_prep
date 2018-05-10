
=begin
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
  #
  product = a * b
  a_multiples = []
  b_multiples = []
  common_multiples = []

  (1..product/a).each do |num|
		a_multiples << a * num
  end
  (1..product/b).each do |num|
  	b_multiples << b * num
  end
  common_multiples = a_multiples.select do |multiple|
    b_multiples.include?(multiple)

  end
  return common_multiples.first
end

puts "-------Least Common Multiple-------"
puts lcm(2, 3) == 6
puts lcm(6, 10) == 30
puts lcm(5, 20) == 20
puts lcm(50, 50) == 50
# ------------------------------------------------------------------------------

# Range Summary
# ------------------------------------------------------------------------------
# Given a sorted array of integers without duplicates, return the start and end
# integers of number ranges found in the array. A number range is considered valid
# when all numbers from start to end are contiguous and only increment by 1.
# Assume all numbers are included as part of a range (no stand alone elements).

def range_summary(array)
  result = []
  temp = []
  xyz = (array.first..array.last)

  i = 0
  while i < array.length
    if temp.length == 0
      temp << array[i]
    elsif temp.length == 1 && array[i] == temp[0] + 1
      temp << array[i]
    elsif temp.length == 1 && array[i] != temp[0] + 1
      result << temp
      temp = [array[i]]
    elsif temp.length == 2 && array[i] != temp[i] + 1
      result << temp
      temp = [array[i]]
    elsif temp.length == 2 && array[i] == temp[1] + 1
      temp[1] = array[i]
    else
      result << temp
      temp = []
    end
    if i == array.length - 1
      result << temp
    end
    i += 1
  end

  result

end

    if array[i + 1] == array[i] + 1
      temp << array[i] + 1



  end

  xyz.each do |num|
    array.each do |n|

    end
    if array.include?(num) == true
      temp << num
    else
      temp = [temp[0], temp[-1]]
      result << temp
      temp = []
    end
  end
  result
end

puts "-------Range Summary-------"
puts range_summary([0, 1]) == [[0, 1]]
puts range_summary([0, 1, 4, 5]) == [[0, 1], [4, 5]]
puts range_summary([0, 1, 3, 4, 6, 7]) == [[0, 1], [3, 4], [6, 7]]
puts range_summary([0, 1, 2, 3, 4, 5, 7, 8, 9, 15, 16]) == [[0, 5], [7, 9], [15, 16]]
# ------------------------------------------------------------------------------


# Longest Segment
# Write a method, #longest_segment, that accepts two strings as arguments. The first is a long
# string of characters, and the second is a delimeter. Split the first string by the delimeter
# and return the longest segment.



def longest_segment(input, delimeter)

  segments = input.split(delimeter)
  segments.sort_by {|segment| segment.length}.last

end

puts "---------Longest Segment----------"
puts longest_segment('this is a string','a') == "this is "
puts longest_segment('this is a string','i') == "s a str"
puts longest_segment('this is a string',' ') == "string"

=end

# # ----------------- Switch Roles!
# String Sum
# Write a method, #string_sum, that accepts a string as an argument and returns the sum of the characters of that string.
# ie: a --> 1, b--> 2 .. z --> 26.

# Assume you have an input of only lower-case characters. You may want to definea helper method! (hint hint)

def string_sum(string)
  sum = 0
  alphabets = ("a".."z").to_a
  string.chars.each do |ch|
    sum += alphabets.index(ch) + 1
  end
  sum
end

puts "---------String Sum----------"
puts string_sum("pizza") == 78
puts string_sum("bagel") == 27
puts string_sum("smoothie") == 104


# ----------------- Read the solutions!
