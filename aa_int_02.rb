#### Alien Phone Number ####
# There is a nearby alien planet whose numbers are formatted as
# "xxxx xxxx" where "x" is any numerical digit (0-9). Write a function
# that determines whether a given string is a valid alien phone number.
#
# constraint: You may not use RegExp.
#
# examples:
# alien_phone_number?('1234 5678') #=> true
# alien_phone_number?('ar32 t19i) #=> false
# alien_phone_number?('123 45678') #=> false
# alien_phone_number?('12345678') #=> false
# alien_phone_number?('1234 567') #=> false
# alien_phone_number?('12345 12345') #=> false
# "12 3 5678"
def alien_phone_number?(str)

  digit = "0123456789"

  if digit.include?(str[0..3] + str[5..8]) == false ||
    str.length != 9 ||
    str[4] != " "
  return false
  end
  true
end

p alien_phone_number?('1234 5678') => true
p alien_phone_number?('ar32 t19i') => false
p alien_phone_number?('123 45678') => false
p alien_phone_number?('12345678') => false
p alien_phone_number?('1234 567') => false
p alien_phone_number?('12345 12345') => false
p alien_phone_number?('12 3 5678') => false

p '0123456789'.include?("12v34"), "===="

# def alien_phone_number?(str)
#   if str.length != 9 || str[4] != ' '
#     return false
#   end
#
#   numbers = ("0".."9").to_a
#
#   str.split(" ").each do |fournum|
#     return false if fournum.length != 4
#     fournum.each_char {|num| return false if !numbers.include?(num)}
#   end
#   return true
# end


#### Math Eval ####
# Eval is a function that takes a string and executes it as code. This
# can be very complicated to implement, so you will only need to
# implement a small subset.
#
# Write a function math_eval that takes a string and evaluates single-digit
# numbers as well as the 4 basic arithmetic functions ( + - * / ). Do not worry about
# parentheses or order of operations. Just evaluate everything from left
# to right. You may also assume that you will be given syntactically
# correct statements with no spaces or extra characters.
#
# Constraint: You may not call eval or any similar function.
#
# Examples:
# math_eval('5') => 5
# math_eval('5+5') => 10
# math_eval('1+2*3') => 9
#
# Bonus: If you have extra time, support double-digit numbers.
# math_eval('10*2/5+16') => 20
def math_eval(string)

  # string converted to array of chars
  # iterate thru array to check if chars are (0 thru 9)
  result = [string[0].to_i]
  arr = string.split("")
  i = 2
  while i < arr.length
    result << arr[i].to_i
    result = [result.reduce(arr[i-1])]
    i += 2
  end
  result[0]
end

def math_eval(string)

  digit = "0123456789"
  result = [string[0].to_i]

  string.chars.each.with_index do|n, i|
    next if i <= 1
    result << n.to_i if digit.include?(n)
    result = [result.reduce(string[i-1])]
  end

  result[0]
end
p math_eval('5') == 5
p math_eval('5+5') == 10
p math_eval('1+2*3') == 9

#### Aliquot Sequence ####
# A number's aliquot sum is the sum of all of its factors excluding itself.
#
# For example, the aliquot sum of 10 is: 1 + 2 + 5 = 8
#
# We can use the aliquot sum to define a special sequence, called the
# aliquot sequence. The aliquot sequence of a number begins with the
# number itself. The second number in the sequence is the first number's
# aliquot sum, the third number is the second number's aliquot sum, and
# so on.
#
# For example, the first 4 numbers in the aliquot sequence of 10 are: 10, 8, 7, 1
#
# Write a function that takes in two numbers, base and n, and returns the
# aliquot sequence of length n starting with base.
#
# Examples:
# aliquot_sequence(10, 4) # => [10, 8, 7, 1]
# aliquot_sequence(10, 2) # => [10, 8]
# aliquot_sequence(7, 4) # => [7, 1, 0, 0]

def aliquot_sequence(num, range)
  # make helper to find aliquot sum
  # go on adding a-sum to an array until its legth is range
  result = [num]

  x = num
  while result.length < range
    result << helper(x)
    x = result[-1]
  end
  result
end

#helper

def helper(n)
  sum = 0
  i = 1
  while i < n
    sum += i if n % i == 0
    i += 1
  end

  sum
end

p aliquot_sequence(10, 4) # => [10, 8, 7, 1]
p aliquot_sequence(10, 2) # => [10, 8]
p aliquot_sequence(7, 4) # => [7, 1, 0, 0]
