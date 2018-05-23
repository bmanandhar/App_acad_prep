
#### Decode ####
# You are given an encoded string. The code is defined as follows:
# * Each character in the encoded string is followed by a single-digit number.
# * The number represents how many times the character appears in a row.
#
# Write a function that takes in an encoded string and returns the original.
# # # Example:
# puts decode("m1i1s2i1s2i1p2i1")
# decoded_string = decode(encoded_string)
# decoded_string # => "mississippi"
def decode(str)
  result = ""
  i = 0
  while i < str.length - 1
    result << str[i]*str[i+1].to_i
    i += 2
  end
  result
end

def decode(str)
  decoded = ""
  str.chars.each.with_index {|ch, x| decoded += ch*str[x+1].to_i if x.even?}
  decoded
end
p decode("m1i1s2i1s2i1p2i1")

# Define a method that, given a sentence, returns a hash of each of the words as keys with their lengths as values. Assume the argument lacks punctuation.

def word_lengths(str)
  hash = Hash.new
  str.split.each {|word| hash[word] = word.length}

  hash
end
p word_lengths("this is a test sentence.")

def word_lengths(str)
  hash = Hash.new
  words = str.split
  i = 0
  while i < words.length
    hash[words[i]] = words[i].length
    i += 1
  end

  hash
end
p word_lengths("this is a test sentence.")

# The fibonacci sequence is defined as follows:
#
# n  : 0  1  2  3  4  5  6  7   8   9   10 ...
# fib: 0  1  1  2  3  5  8  13  21  34  55 ...
#
# Write a method fib_sum(n) that returns the sum of the first n
# fibonacci numbers.

def fib_sum(n)

  return 0 if n == 0
  fibs = [0, 1]

  while fibs.length <= n
    fibs << fibs[-2] + fibs[-1]
  end

  fibs.reduce("+")
end
#another method
def fibs(n)

  fibs = [0, 1]
  until n == fibs.length
    fibs << fibs[-1] + fibs[-2]
  end
  fibs

end

puts "_________fib_sum___________"
puts fib_sum(0) == 0
puts fib_sum(2) == 2
puts fib_sum(5) == 12
puts fib_sum(22) == 46367
puts fib_sum(60) == 4052739537880


# Write a method - five_ws, that takes one or more sentences and
# returns them as questions if they contain the words: why, what, where,
# who,  when.

def five_ws(string)

  result = []
  # can be written each word separated by a comma or a space
  quest = "whywhatwherewhowhen"
  # sentences separated if present multiple
  sentences = string.split(".")

  sentences.each do |sentence|
    # words in sentence separated
    words = sentence.split

    if quest.include?(words[0].downcase)
      result << sentence + "?"
    else
      result << sentence + "."
    end
  end

  result.join
end
puts "_________five_ws____________"
puts five_ws("Where can I find new shoes. I'm missing my favorite pair.") == "Where can I find new shoes? I'm missing my favorite pair."
puts five_ws("Who is at the door.") == "Who is at the door?"
puts five_ws("Whenever you are ready I'll meet you at the shop.") == "Whenever you are ready I'll meet you at the shop."
puts five_ws("Who. What. Where. When.") == "Who? What? Where? When?"

# write a method longest_pause(string) that takes a string and counts the
# longest "ummmm". For example:
# longest_pause("ummmmmmm") => 8
#1:55

def longest_pause(sentence)
  # 1. remove all punctuation in the string
  # 2. split into array of words
  # 3. traverse through array looking for words that contain "u" and "m" at first and second positions respectively
  # 4. once found pt 3, length of word pushed to result
  # 5. return max value of array

  result = []

  words = sentence.delete(".,?/:;").split
  words.each {|word| result << word.length if word[0,2] == "um"}
  result.max
end

puts "_______longest_pause________"
puts longest_pause("ummmmmmm") == 8
puts longest_pause("Hi there, I'm um here for the interview") == 2
puts longest_pause("um, I'm umm not sure.") == 3
puts longest_pause("ummmmm, I'm umm not sure.") ==

# write a method cat_pairs(cat_names, cat_price) that iterates over the
# array of cat names and finds the cheapest pair of cats one can buy.
# Return an array of the cat's names in the order in which they appear
# in the original array. Beware: cat_names may contain cats that are no
# longer for sale.

# Example:
# cat_names_1 = ["jeff", "muenster", "currie", "breakfast"]
# cat_price_1 = {"jeff" => 24, "muenster" => 100, "currie" => 30, "breakfast" => 50}
# cat_pairs(cat_names_1, cat_price_1) => ["jeff", "currie"]

def cat_pairs(cat_names, cat_price)
  #1. check for available cats by name-array
  #2. find cheapest cats sorted by price and choose first two
  #3. extract cat names from the array to push to return as result

  pair = []
  available_cats = cat_price.select {|cats| cat_names.include?(cats)}
  cheapest_cats = available_cats.sort_by {|cat, price| price}[0, 2]
  cheapest_cats.each {|cat| pair << cat[0]}

  pair
end

puts "_________cat_pairs__________"

cat_names_1 = ["jeff", "muenster", "currie", "breakfast"]
cat_names_2 = ["muenster", "currie", "breakfast"]
cat_names_3 = ["callie", "jeff", "macy", "fitz"]
cat_names_4 = ["callie", "jeff", "macy", "breakfast"]
cat_price_1 = {"jeff" => 24, "muenster" => 100, "currie" => 30, "breakfast" => 50}
cat_price_2 = {"callie" => 24, "fitz" => 100, "jefferson" => 30, "macy" => 50}

puts cat_pairs(cat_names_1, cat_price_1) == ["jeff", "currie"]
puts cat_pairs(cat_names_2, cat_price_1) == ["currie", "breakfast"]
puts cat_pairs(cat_names_3, cat_price_2) == ["callie", "macy"]
puts cat_pairs(cat_names_4, cat_price_1) == ["jeff", "breakfast"]
puts cat_pairs(cat_names_4, cat_price_2) == ["callie", "macy"]

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
  # your code goes here
  a_mult, b_mult = [], []
  (1..b).each {|x| a_mult << x * a}
  (1..a).each {|x| b_mult << x * b}
  common_mult = a_mult.select {|mult|b_mult.include?(mult)}

  common_mult.first
end
#another method
def lcm(a, b)
  # your code goes here
  (1..a*b).each {|n| return n if n % a == 0 && n % b == 0}
end

puts "-------Least Common Multiple-------"
puts lcm(2, 3) == 6
puts lcm(6, 10) == 30
puts lcm(5, 20) == 20
puts lcm(50, 50) == 50

# Range Summary
# ------------------------------------------------------------------------------
# Given a sorted array of integers without duplicates, return the start and end
# integers of number ranges found in the array. A number range is considered valid
# when all numbers from start to end are contiguous and only increment by 1.
# Assume all numbers are included as part of a range (no stand alone elements).

def range_summary(array)
  # initiate an empty array, accumulator
  # iterate thru the given array looking for contiguity
  # add ints to chunk if contiguos, extract first and last when not contiguos

  result = Array.new
  array.each.with_index do |x, i|
    range = []
    if x + 1 == array[i + 1]
      range << x << array[i+1]
    else result << [range.first, range.last]
      # range = []
    end
  end

 result
end

puts "-------Range Summary-------"
puts range_summary([0, 1]) == [[0, 1]]
puts range_summary([0, 1, 4, 5]) == [[0, 1], [4, 5]]
puts range_summary([0, 1, 3, 4, 6, 7]) == [[0, 1], [3, 4], [6, 7]]
puts range_summary([0, 1, 2, 3, 4, 5, 7, 8, 9, 15, 16]) == [[0, 5], [7, 9], [15, 16]]

# Repeated Chars
# ------------------------------------------------------------------------------
# Define a method, #repeated_chars, that accepts a string as an argument. The method
# should return an array of all the characters that appear multiple times consecutively.
# If a single character is repeated on separate occasions, in should be included
# multiple times in the result.

# repeated_chars("mississippi") => ["s", "s, "p"]
# ------------------------------------------------------------------------------
def repeated_chars(word)
  # 'result' array as accumlator
  # use '.each' method to iterate and count chars
  # if chars at 'i+1' is equal to char at 'i' move char to temp
  # if fails, move temp-char to result
  result, temp = [], []
  word.chars.each.with_index do |ch, i|
    if ch == word[i+1]
      temp << ch
    else
      result.concat(temp.uniq)
      temp = []
    end
  end

  result
end
# ------------------------------------------------------------------------------
puts "-------Repeated Chars-------"
puts repeated_chars("cat") == []
puts repeated_chars("caat") == ['a']
puts repeated_chars("applle") == ['p', 'l']
puts repeated_chars("caataapulllllt") == ['a', 'a', 'l']

# Long Word Count

# Return the number of words longer than 7 characters
# "cat cactus balderdash phenomenon amazon" has two words over 7 characters long
# "balderdash" and "phenomenon"
# long_word_count("cat cactus balderdash phenomenon amazon") => 2

def long_word_count(text)
  #split string by (" ") into an array
  #use (.each) method iterating thru array
  #counter adds 1 if length of word is longer than 7
  counter = 0
  text.split.each {|word| counter += 1 if word.length > 7}
  counter
end

puts "-------Long Word Count-------"
puts long_word_count("") == 0
puts long_word_count("short words only") == 0
puts long_word_count("one reallylong word") == 1
puts long_word_count("two reallylong words inthisstring") == 2

# Calculate

# Define a method, #calculate, that accepts two arguments: a starting value and an
# array of commands. The method should preform the specified commands and return the
# final value. An example of commands might look like:

# [["+", 3], ["/",4 ], ['-', 10], ["*", 6]]

# Note that this is an array of arrays, where the first element is the operation to perform,
# and the second argument is the value to use in the operation. You only need to account
# for the 4 basic operations: +, -, *, and /
# ex: calculate(3, [["*", 5]]) ==> 3 * 5 == 15
# ex: calculate(2, [["+", 2], ["/",4 ]]) ==> (2 + 2) / 4 == 1
#how to pull * out of string?!?!?!

def calculate(starting_value, operations)

  result = [starting_value]

  operations.each do |op|
    result << op.last
    result = [result.reduce(op.first)]
  end

  result.first
end

puts "-------Calculate-------"
puts calculate(3, [["*", 5]]) == 15
puts calculate(2, [["+", 2], ["/",4 ]]) == 1
puts calculate(0, [["+", 3], ["/", 3], ['-', 10], ["*", 6]]) == -54
puts calculate(10, [["+", 1], ["+", 10], ['-', 3], ["/", 2]]) ==

# Hashtagify

# Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# in the original string and return the updated cool string with hashtags.

def hashtagify(sentence, tags)
  # check for downcase/upcase words
  #
  result = []

  words = sentence.split
  sentence.downcase.delete(".,?!").split.each_with_index do |word, i|
    if tags.include?(word)
      result << "#" + words[i]
    else
      result << words[i]
    end
  end

  result.join(" ")
end

puts "-------Hashtagify-------"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("coding is fun", ["fun", "coding"]) == "#coding is #fun"
puts hashtagify("Learned about coding. Coding is fun!", ["coding", "fun"]) == "Learned about #coding. #Coding is #fun!"

# Vigenere Cipher

# Vigenere's Cipher is a tool for encrypting strings. We'll offset each character
# according to a key sequence. For example, if we encrypt "bananasinpajamas" with the
# key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
#
# Word:   b a n a n a s i n p a j a m a s
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Cipher: c c q b p d t k q q c m b o d t
#
# Note that offsets should wrap around the alphabet - offsetting 'z' by 1 should
# produce 'a'

# Write a method that takes a string and a key-sequence, returning
# the encrypted word. Assume only lower-case letters are used.

# We're giving you the alphabet as an array if you need it.

def vigenere_cipher(string, key_sequence)
  # empty string result
  # range of alphas a..z + a..z
  # find index position of char exactly as per range
  # add the shift position, get to result to return
  result = ""
  alpha = ("a".."z").to_a + ("A".."Z").to_a

  i = 0
  string.each_char do |x|
    result << alpha[alpha.index(x.downcase) + key_sequence[i]]
    if i == key_sequence.length - 1
      i = 0
    else
      i += 1
    end
  end

  result
end

def vigenere_cipher(string, key_sequence)
  # empty string result
  # range of alphas a..z + a..z
  # find index position of char exactly as per range
  # add the shift position, get to result to return
  result = ""
  alpha = ("a".."z").to_a

  i = 0
  string.each_char do |x|
    idx = alpha.index(x) + key_sequence[i]
    idx = idx - 26 if idx > 25
    result << alpha[idx]
    if i == key_sequence.length - 1
      i = 0
    else
      i += 1
    end
  end

  result
end


puts "----Vigenere cipher----"
puts vigenere_cipher("abcd", [1, 2]) == "bddf"
puts vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
puts vigenere_cipher("toarrispirate", [1, 2, 3, 4]) == "uqdvskvtjtdxf"
puts vigenere_cipher("zzz", [1, 2, 1]) === "aba"

def vigenere_cipher(string, key_sequence)

# using 'while' loop, iterate thru each char
# get reference-index of char ahead following key_sequence
# convert char following new inex with respect to alphas

  result = ""
  alphas = ("a".."z").to_a

  i = 0
  while i < string.length
    j = 0
    while j < key_sequence.length
      z = alphas.index(string[i]) + key_sequence[j]
      z = z - 26 if z > 25
      result << alphas[z]
      i += 1
      break if i == string.length
      j += 1
    end
  end

  result
end

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
# NOTE: DO NOT USE THE INTEGER METHOD LCM. DO NOT CALL a.lcm(b) YOU WILL NOT RECEIVE CREDIT AND WILL FAIL.

def lcm(a, b)
  (1..a*b).each {|num|return num if num % a == 0 && num % b == 0}
end

puts "-------Least Common Multiple-------"
puts lcm(2, 3) == 6
puts lcm(6, 10) == 30
puts lcm(5, 20) == 20
puts lcm(50, 50) == 50

# You have 100 cats (You are quite lucky to own so many cats!).
# You have arranged all your cats in a line. Initially, none of your
# cats have any hats. You take 100 rounds walking around the cats,
# always starting with the first cat. Every time you stop at a cat,
# you put a hat on it if it doesn't have one, and you take itshat off if it has one on.

# The first round, you stop at every cat. The second round, you only
# stop at every 2nd cat (#2, #4, #6, #8, etc.). The third round, you
# only stop at every 3rd cat (#3, #6, #9, #12, etc.). You continue this
# process until the 100th round (i.e. you only visit the 100th cat).

# Write a program that prints which cats have hats at the end.

def cats_in_hats
  # array of length 100, initial value as 'false'
  # iterate 100 times over the array, each time flipping nth cats' hat status
  # final array after 100 rounds with hat status
  # another array of cats with hat status 'true'

  cats_with_hats = Array.new # result with hat status 'true'
  cats = Array.new(100, false)

  (1..100).each do |rnd|
    i = rnd - 1
    while i < cats.length
      cats[i] = !cats[i]
      i += rnd
    end
  end
  cats.each_index {|i| cats_with_hats << i + 1 if cats[i]}
  cats_with_hats
end

#another method with helper :
def cats_in_hats

  cats = (1..100).collect {false}
  (1..100).each do |rnd|
    i = rnd - 1
    while i < cats.length
      cats[i] = !cats[i]
    i += rnd
    end
  end
  cats_with_hats(cats)
end
#helper
def cats_with_hats(cats)
  cats_with_hats = Array.new
  cats.each_index {|i| cats_with_hats << i + 1 if cats[i]}
  cats_with_hats
end
p cats_in_hats == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

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
def alien_phone_number?(num)

  digit = "0123456789"

  if num[4] != " " || num.length != 9
    return false
  else
    num.split(num[4]).all? {|x| digit.include?(x)}
   end

end
p alien_phone_number?('1984 5658') => true
p alien_phone_number?('ar32 t19i') => false
p alien_phone_number?('123 45678') => false
p alien_phone_number?('12345678') => false
p alien_phone_number?('1234 567') => false
p alien_phone_number?('12345 12345') => false


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
  arr = string.chars
  digit = ("0".."9")
  total = arr[0].to_i

  arr.each_with_index do |x, i|
     unless digit.include?(x) # if digit.include?(x) == false
      array = [total, arr[i+1].to_i]
      total = array.reduce(x)
    end
  end

  total
end
p math_eval('5') => 5
p math_eval('5+5') => 10
p math_eval('1+2*3') => 9

# Instructions
#
# You have 1 hour for this assessment. Give yourself about 15 minutes per problem.
# Move on if you get stuck
#
# Everything should print 'true' when you run the file. When time is up, make
# sure you don't have any unexpected `end`s or infinite loops that would keep your
# code from running.
#
# This assessment is strictly closed notes. No paper notes and no internet!
#
# Look at the test cases below the problem before you approach it.
#
# Good luck!

# Multiply Me

# Define a method, #multiply_me(array, int), that accepts an array and an integer
# as arguments. Your method should return a new array, with all of the elements in
# the original array multiplied by the int.

def multiply_me(array, int)

  result = Array.new
  array.each {|x| result << x*int }

  result
end

puts "-------Multiply Me-------"
puts multiply_me([], 1) == []
puts multiply_me([1, 2, 3], 1) == [1, 2, 3]
puts multiply_me([2, 4, 6], 2) == [4, 8, 12]
puts multiply_me([2, 15, 100], 0) == [0, 0, 0]


# Max Range

# Define a method, #max_range(array), that accepts an array of integers as an argument.
# Your method should return the difference between the largest integer and the smallest
# integer in the array. Assume the array always has at least 2 elements.

# ex: max_range(1, 8, 4) ==> largest = 8, smallest = 1 ==> 8 - 1 ==> 7

def max_range(array)

  array.max - array.min
end

puts "-------Max Range-------"
puts max_range([9, 7]) == 2
puts max_range([9, 7, 3, 8]) == 6
puts max_range([1, 1, 0, 0]) == 1
puts max_range([10, -15, 100, 30]) == 115


# Remove W Words

# Define a method, #remove_w_words(sentence), that accepts a string as an argument
# Your method should return a new string, omitting all the words that start
# with "w"

def remove_w_words(sentence)

  result = []
  sentence.split.each do |word|
    result << word if word.chars[0] != "w"
  end

  result.join
end

puts "-------Remove W Words-------"
puts remove_w_words("") == ""
puts remove_w_words("words") == ""
puts remove_w_words("throw it this way") == "throw it this"
puts remove_w_words("string with a whole lot of w words") == "string a lot of"


# Prime?

# Define a boolean method, #prime?(int), that accepts an integer as an argument.
# Your method should return true / false, based on whether or not n is prime.
# Remember, a number is prime if it has no divisors other than 1 and itself.

# ex: 15's divisors are: 1, 3, 5, 15 ==> 15 is not prime!
# ex: 20's divisors are: 1, 2, 4, 5, 10, 20 ==> 20 is not prime!
# ex: 17's divisors are: 1, 17 ==> 17 is prime!

def prime?(int)
  i = 4
  while (i...int)
    return int % i != 0
  end
end

puts "-------Prime?-------"
puts prime?(2) == true
puts prime?(16) == false
puts prime?(17) == true
puts prime?(101) == true

=begin
Narcissistic Numbers
From Codewars, highly recommend completing there (they have test cases)
A Narcissistic Number is a number which is the sum of its own digits,
each raised to the power of the number of digits.

For example, take 153 (3 digits):

1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
and 1634 (4 digits):

1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634
The Challenge:
Your code must return true or false depending upon whether
the given number is a Narcissistic number.

Error checking for text strings or other invalid inputs is not required,
only valid integers will be passed into the function.

=end
def narcissistic?(num)
  # check length
  sum = 0
  n = num.to_s
  n.each_char {|x| sum += x.to_i**n.length}
  num == sum
end
p narcissistic?(153) => true
p narcissistic?(1634) => true
p narcissistic?(7834) => false

=begin
nth Prime Number
Adapted from Project Euler Problem 7
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
we can see that the 6th prime is 13.

What is the nth prime number?

  nth_prime(6) => 13
  nth_prime(10) => 29
  nth_prime(1000) => 7919
=end

def nth_prime(n)

  primes = []
  i = 2
  while primes.length < n
    primes << i if prime?(i)
    i += 1
  end
  primes.last
end

# helper

def prime?(int)
  arr = []
  i = 1
  while i <= int
    arr << i if int % i == 0
    i += 1
  end
  arr.length == 2
end
p nth_prime(6) => 13
p nth_prime(10) => 29
p nth_prime(1000) => 7919

#unexpected
# Define a method that returns a boolean indicating whether
#its second argument is a substring of its first.
def substring?(long_string, short_string)

  return true if long_string.include?(short_string)

  false
end

# Write a method that, given a string, returns a hash in which each key is a
#character in the string and each value is an array of the first and last indices
# where that character occurs. If the character occurs only once, the array
#should contain a single index. Consider defining helper methods.
# first_last_indices("banana") => {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
def first_last_indices(str)

  # get a unique array that will include all chars
  # iterate through str verifying how many time each char occurs

  hash = Hash.new
  key = str.split("").uniq

  key.each do |k|
    hash[k] = helper(k, str)
  end
  hash
end
# helper
def helper(x, str)
  indices = Array.new

  str.split("").each.with_index {|ch, i| indices << i if ch == x}
  if indices.length == 1
    indices
  else
    [indices.first, indices.last]
  end
end

p first_last_indices("banana") => {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
p first_last_indices("kathmandu") => {"k"=>[0], "a"=>[1, 5], "t"=>[2], "h"=>[3], "m"=>[4], "n"=>[6], "d"=>[7], "u"=>[8]}
p first_last_indices("europe") => {"e"=>[0, 5], "u"=>[1], "r"=>[2], "o"=>[3], "p"=>[4]}

# Define a method that returns the number of times that two adjacent numbers
#in an array sum to n. Don't reuse numbers.
# count_adjacent_sums([1, 5, 1, 3, 3], 6) => 2
def count_adjacent_sums(array, n)

  sum = 0
  i = 1
  while i < array.length - 1
    if array[i] + array[i-1] == n || # n = (5+1), 3+1
      array[i] + array[i+1] == n     # 5+1, n = (3+3)
      sum += 1                       # 2
    end
    i += 2
  end
  sum
end
p count_adjacent_sums([1, 5, 1, 3, 3], 6) => 2

# Return an array of characters on which we can split an input string to produce
# substrings of the same length.
# Don't count empty strings after the split.
# Here's an example for "banana":
# "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# "banana".split("b") # => ["", anana"] (all elements same length - there's only
# one element "anana" because the empty string doesn't count)
# "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
# result: ["b", "a"]

def even_splitters(string)
  result = []
  #
  # your code goes here
  splt = []
  string.chars.uniq.each do |x| # string -> uniq array
    splits = string.split(x).reject {|y| y == ""} # string split into array by each uniq char and rejected if ""
    if splits.all? {|z| z.length == splits[0].length} # lengths of all els equal?
      result << x # push chars to array if lengths equal
    end

  end
  result
end

puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == ["j", "k"]
puts even_splitters("xoxo") == ["x", "o"]
puts even_splitters("banana") == ["b","a"]
puts even_splitters("mishmash") == ["m","h"]

# Challenge
# Using the Ruby language, have the function CaesarCipher(str,num) take the str parameter
# and perform a Caesar Cipher shift on it using the num parameter as the shifting number.
# A Caesar Cipher works by shifting each letter in the string N places down in the alphabet
# (in this case N will be num). Punctuation, spaces, and capitalization should remain intact.
# For example if the string is "Caesar Cipher" and num is 2 the output should be "Ecguct Ekrjgt".

# Input:"Hello" & num = 4
# Output:"Lipps"

# Input:"abc" & num = 0
# Output:"abc"

def CaesarCipher(str,num)

  # range of alphas from"a" TO "z"
  result = ""
  alpha_dn = ("a".."z").to_a + ("a".."z").to_a
  alpha_up = ("A".."Z").to_a + ("A".."Z").to_a

  str.chars.each do |x|

    if !alpha_dn.include?(x) && !alpha_up.include?(x)
      result << x
    elsif x == x.downcase
      result << alpha_dn[alpha_dn.index(x) + num] #num < 26
    elsif x == x.upcase
      result << alpha_up[alpha_up.index(x) + num]
  	end
  end

	result
end
p CaesarCipher("Kathmandu", 10)

=begin
# Two-Sum

# Define a method, #two_sum, that accepts an array
and a target sum (integer) as arguments.
# The method should return true if any two integers
in the array sum to the target.
# Otherwise, it should return false.
Assume the array will only contain integers.
=end

def two_sum(array, target)
  # your code here
  array.each_with_index do |x, i|
    sub_array = array[0...i] + array[i+1..-1]
    return true if sub_array.include?(target - x)
  end
  false
end

puts "------Two Sum------"
puts two_sum([1,2,3,4,5,6], 8) == true
puts two_sum([1,2,3,4,5,6], 18) == false
puts two_sum([1,3,6], 6) == false
puts two_sum([1,8,2,1], 0) == false

# Vowel Censor
# ----------------------------------------
# Write a method, #vowel_censor that takes in a string and replaces
# any vowels in it with an "X". Do not modify the original string.

def vowel_censor(string)
  # create an empty string, result
  # traverse through each char of the given string
  # shovel chars to result if not vowel
  # shovel "X" to result if vowel
  # all chars assumed downcase
  vowels = "aeiou"
  result = ""
  string.each_char do |ch|
    if vowels.include?(ch)
    result << "X"
  else
    result << ch
    end
  end
  result
end

puts "---------Vowel Censor----------"
puts vowel_censor("let's order a pizza") == "lXt's XrdXr X pXzzX"
puts vowel_censor("nitwit, blubber, oddment, tweak") == "nXtwXt, blXbbXr, XddmXnt, twXXk"
puts vowel_censor("supercalifragilisticexpialidocious") == "sXpXrcXlXfrXgXlXstXcXxpXXlXdXcXXXs"

# ----------------- Switch Roles!

=begin
# Largest Factor
# ----------------------------------------
# Write a method, #largest_factor,
that accepts an integer as an argument and returns
# the largest factor of that integer
=end

def largest_factor(n)

  (n/2).downto(1) {|x| return x if n % x == 0}
end

puts "---------Muni Routes----------"
puts largest_factor(10) == 5
puts largest_factor(143) == 13
puts largest_factor(27) == 9
puts largest_factor(17) == 1


# Wild Sum

# Define a method, #wild_sum(n) that sums all the numbers less than n that are:
#   - Divisible by 2 or divisible by 3
#   - Not divisible by both 2 and 3

# ex: wild_sum(16) ==> 2 + 3 + 4 + 8 + 9 + 10 + 14 + 15 ==> 65

def wild_sum(n)
  # iterate through all integers starting from 1 untill it's less that n (exclusive)
  # check each num if divisible by 2 or 3 but nut by 2*3
  # rejected if divisuble by 2*3, acceptes if divisible by 2 or 3
  sum = 0
  (1...n).each do |i| # iteration starts

    if i % 2 == 0 && i % (2 * 3) != 0 # check if num is div by 2, not by 2*3
      sum += i
    elsif i % 3 == 0 && i % (2 % 3) != 0 # check if num is div by 3, not by 2*3
      sum += i
    end
  end
  sum
end

puts "------Wild Sum------"
puts wild_sum(0) == 0
puts wild_sum(2) == 0
puts wild_sum(3) == 2
puts wild_sum(7)

# Rubyify
# ----------------------------------------
# Define a method that turns regular sentences into (really bad and
# super long) ruby method names.

def rubyify(sentence)
  #sentence first is downcased, split by space, then joined by underscore to convert into a new string
  sentence.downcase!.split.join("_")
end

puts "---------Rubyify----------"
puts rubyify("Leave the gun take the cannoli") == "leave_the_gun_take_the_cannoli"
puts rubyify("Driver roll up the partition please") == "driver_roll_up_the_partition_please"
puts rubyify("Wanna get Cheeseboard pizza?") == "wanna_get_cheeseboard_pizza?"

# ----------------- Switch Roles!

# Find Factors
# ----------------------------------------
# Define a method, #find_factors(n, possible_factors), that accepts two arguments:
# an integer, n, and an array of integers, possible_factors. Find all the elements
# in possible_factors that are factors of n.

def find_factors(n, possible_factors)

  # O=> factors of n,
  # I=> traverse through array
  # C=> some items may not be good
  # E=> array-item should not be greater than n
  possible_factors.select {|x| n % x == 0} # use of ruby-select method, criteria n % x == 0
end

puts "---------Find Factors----------"
puts find_factors(33, [1, 10, 11, 15, 18, 20]) == [1, 11]
puts find_factors(81, [2, 3, 9, 16, 51, 53]) == [3, 9]
puts find_factors(17, [2, 3, 4, 5, 6, 7, 8, 9]) == []

# Every Other Letter

# Define a method, #every_other_letter(string), that accepts a string as an argument.
# This method should return a new string that contains every other letter of the
# original string, starting with the first character. Treat white-space
# and punctuation the same as letters.

def every_other_letter(string)
  # your code here
  every_other_letter = ""
  i = 0
  for i in 0 ... string.length
    if i % 2 == 0
      every_other_letter << string[i]
    end
  end
  every_other_letter
end

puts "------Every Other Letter------"
puts every_other_letter("abcde") == "ace"
puts every_other_letter("i heart ruby") == "ihatrb"
puts every_other_letter("an apple a day...") == "a pl  a.."

# Three Digit Format

# Define a method, #three_digit_format(n), that accepts an integer, n, as an
# argument. Assume that n < 1000. Your method should return a string version of
# n, but with leading zeros such that the string is always 3 characters long.

def three_digit_format(n)
  # your code here
  # assume length of string (converted from int) id less than 3
  # add "0"'s  to make its length 3
  "0"*(3 - n.to_s.length) + n.to_s
end
#another method
def three_digit_format(n)

  n.to_s.rjust(3, "0")
end

puts "------Three Digit Format------"
puts three_digit_format(100) == "100"
puts three_digit_format(15) == "015"
puts three_digit_format(6) == "006"

=begin
# Define a method that, given an array of numbers,
returns another array with each of the argument's numbers
multiplied by two. Do not modify the original array.
=end

def array_times_two(arr)

  # create an empty array, result
  # iterate thru the given array
  # multiply each el by 2
  # push the multiplied el to new array
  array = Array.new
  arr.each {|el| array << el * 2}
  array
end
p array_times_two([1,4,-2,7,0])

=begin
# Define a method that, given an array of numbers,
mulitplies each of its elemnets by two.
This SHOULD mutate the original array!
=end
def array_times_two!(arr)

  arr.map! {|x| 2 * x}

end
p array_times_two!([1, 4, -2, 7, 0]) => [2, 8, -4, 14, 0]
=begin
# Define a method that, given an array of numbers,
returns another array with each of the argument's numbers
multiplied by two. Do not modify the original array.
=end

def array_times_two(arr)

  # create an empty array, result
  # iterate thru the given array
  # multiply each el by 2
  # push the multiplied el to new array
  array = Array.new
  arr.each {|el| array << el * 2}
  array
end
p array_times_two([1,4,-2,7,0])

=begin
# Define a method that, given an array of numbers,
mulitplies each of its elemnets by two.
This SHOULD mutate the original array!
=end
def array_times_two!(arr)

  arr.map! {|x| 2*x}

end
p array_times_two!([1,4,-2,7,0])
=begin
Define a method that substitutes all five-letter words in its argument
with "#####" and returns the result. Do not consider punctuation.
redact_five_letter_words("long longer longest longy") => "long longer longest #####"
=end
def redact_five_letter_words(str)
  # empty array created
  # str split into words and traverse thru each word
  #
  new_arr = []
  str.split.each do |word|
    if word.delete("#/.,").length == 5
      new_arr << "#####"
    else new_arr << word
    end
  end
  word.join(" ")
end

def largest_pair(pairs_array)
  # assume greatest sum as the sum total of first array
  greatest_sum = pairs_array[0].reduce(:+)
  # empty array created
  largest_pair = []
  # iterates through arrays in pairs_array
  pairs_array.each do |arr|
  # sum of each array in pairs_array
  sum_each = arr.reduce(:+)
    # comparing each sum
    if sum_each >= greatest_sum
      greatest_sum = sum_each
      largest_pair = arr
    end
  end

  largest_pair
end
p largest_pair([[-4,0],[-2,-1],[-3,2]])


# Define a method that reverses the digits of its argument and returns the resulting number.
# reverse_digits(1738) => 8371
def reverse_digits(int)

  int.to_s.reverse.to_i
end
p reverse_digits(1738) => 8371

=begin
# Define a method, #pair_product?, that accepts two arguments:
an array of integers and a target_product (an integer).
The method returns a boolean indicating whether any pair of
elements in the array multiplied together equals that product.
You cannot multiply an element by itself. An element on its own
is not a product.
# pair_product?([3, 1, 5], 15) => true
=end

def pair_product?(arr, target_product)
  # consider reading out all els from index[0] to index[-2] of the array given since we need to make a pair with each that we consider to read
  # iterate thru it making a forward-subarray each time
  # check if any of the subarray gives us a boolean 'true'
  # elsewise return 'false'
  i = 0
  while i < arr.length - 1 # index [-2]
    sub_arr = arr[i+1..-1] # exclude el and look forward, previous els not considered
    return true if sub_arr.include?(target_product/arr[i]) # gives a boolean 'true'
    i += 1
  end

  false
end
p pair_product?([3, 1, 5], 15)
=begin
# Define a method, #slice_between_vowels(word),
that accepts a string as an argument.
Your method should return the slice of
the word between the first and last vowels
of that word. Return an empty string if the word
has less than 2 vowels.

# slice_between_vowels("serendipity") => "rendip"
# slice_between_vowels("train") => "trn"
# slice_between_vowels("dog") => ""
=end

def slice_between_vowels(word)
  # created a key of vowels in a string
  # iterate thru the word to locate indices of vowels if present
  #
  result = ""
  vowels = "aeiouAEIOU"
  vowel_indices = []
  word.chars.each.with_index do |ch, i|
    vowel_indices << i if vowels.include?(ch)
  end

  if vowel_indices.length > 1
    result = word[0...vowel_indices[0]] + word[vowel_indices[-1]+1..-1]
  end
  result
end
p slice_between_vowels("serendipity") => "rendip"
p slice_between_vowels("train") => "trn"
p slice_between_vowels("dog") => ""


# Define a method that returns the sum of all the non-negative integers up to and including its argument.
# sum_to(3) => 6
def sum_to(int)
  # declare a variable 'sum' with initial value of 0
  # declare a range upto the given number
  # traverse through the range adding all numbers
  sum = 0
  (1..int).each {|x| sum += x}

  sum
end
p sum_to(3) => 6
p sum_to(100) => 5050
p sum_to(10) => 55

# A magic number is a number whose digits, when added together, sum to 7, e.g., 34. Define a method that returns an array of the first n magic numbers. You may wish to write a helper method that returns a boolean indicating whether a number is magic.
# magic_numbers(3) => [7, 16, 25]

def magic_numbers(n)
  # declare an array 'result' with one element of value 7
  # traverse through a range ranging from 8 up, 7 being the first m/num
  #
  result = [7]
  i = 16
  while result.length < n
    result << i if helper(i)
    i += 1
  end

  result
end

#helper

def helper(x)
  sum = 0
  x.to_s.chars.each {|d| sum += d.to_i}
  sum == 7
end
p magic_numbers(3) => [7, 16, 25]
p magic_numbers(7) => [7, 16, 25, 34, 43, 52, 61]

=begin
Define a method that given an array,
returns another array of only the unique
elements from the first. Do not use the
built-in uniq method.
# uniq([5, 5, 5, 5]) => [5]
# uniq([1, 2, 1, 3, 3]) => [1, 2, 3]
=end

def uniq(arr)
  unique = []
  arr.each {|x| unless unique.include?(x)
    unique << x
  end }
  unique
end
p uniq([1, 2, 1, 3, 3]) => [1, 2, 3]
p uniq([9,3,1,3,9,7]) => [9, 3, 1, 7]

=begin
Define a method that receives two arrays as arguments and
returns a new array of arguments unique among both arrays
(but not necessarily within the array it occurs).
Maintain original (intra- and inter-array) order.
#all_uniqs([1, 1, 3, 6], [2, 3, 6]) => [1, 2]
# all_uniqs([1, 2, 3], [1, 2, 3]) => []
=end

def all_uniqs(arr1, arr2)

  uniques = Array.new
  uniq1, uniq2 = helper(arr1), helper(arr2)
  uniq1.each {|x| uniques << x if !uniques.include?(x) && !uniq2.include?(x)}
  uniq2.each {|x| uniques << x if !uniques.include?(x) && !uniq1.include?(x)}

  uniques
end
#helper
def helper(arr)
  unique = []
  arr.each {|x| unique << x unless unique.include?(x)}
  unique
end
p all_uniqs([1, 1, 3, 6], [2, 3, 6]) => [1, 2]
p all_uniqs([-4, 5, 9, 1], [8,4,9,1]) => [-4, 5, 8, 4]


def all_uniqs(arr1, arr2)
  # empty array to collect elements
  all_uniqs = []

  # checks for elements in arr1
  arr1.each_index do |index|
    all_uniqs << arr1[index] if all_uniqs.include?(arr1[index]) == false && arr2.include?(arr1[index]) == false
  end

  # checks for elements in arr2
  arr2.each_index do |index|
    all_uniqs << arr2[index] if all_uniqs.include?(arr2[index]) == false && arr1.include?(arr2[index]) == false
  end

  returns the result
  all_uniqs.sort
end

#cats in hats
def cats_in_hats

  cats = Hash.new # created an empty hash, cats
  (1..100).each {|i| cats[i] = false} # 100 cats with value false

  (1..100).each do |i| # 100 rounds of visit
    cats.each {|num, _| cats[num] = !cats[num] if num % i == 0} # each round flipping values of cats that correspond to the nth round, every nth cat, no matter what value it has to start with
  end

  cats.select {|num, bool| bool == true}.keys # selected cats having value true
end
p cats_in_hats

# A "slippery number" has 3 as a factor or has 5 as a factor, but not both. 6 is a slippery, but 30 is not. Define a method that returns a boolean indicating whether its argument is slippery.
def is_slippery?(n)
  # 0. check for etreme cases, here it's 15, 30 etc
  # 1. check if n is divisible by 3 and not buy 3*5
  # 2. check if n is divisible by 5 and not buy 3*5
  # 3. return boolean true/flase

  if n % (3*5) == 0
    false

  elsif n % 3 == 0 || n % 5 == 0
    true

  end
end
p is_slippery?(30)

# Write a method that, given an integer n, returns an array of the first n slippery numbers.
# slippery_numbers(7) => [3, 5, 6, 9, 10, 12, 18]
def slippery_numbers(n)

  result = [] # empty array equivalent Array.new

  i = 3 # loop to check for magic_numbers unless result length is not equal to n

  while result.length < n
    result << i if helper(i)
    i += 1
  end

  result
end
#helper
def helper(x)
  if x % (3*5) == 0
    false
  elsif x % 3 == 0 || x % 5 == 0
    true
  end
end
p slippery_numbers(7)

# Define a method, #e_words(str), that accepts a string as an argument. Your method returns the number of words in the string that end with the letter "e".
# e_words("tree") => 1
# e_words("Let be be finale of seem.") => 3
def e_words(str)
  result = 0
  str.split.each {|word| result += 1 if word[-1] == "e"}
  result
end
p e_words("tree") => 1
p e_words("Let be be finale of seem.") => 3

# The Fibonacci Sequence follows a simple rule: the next number in the sequence is the sum of the previous two. The sequence begins with [0, 1]. One computes the third number by summing the first and  second (0 + 1 == 1), yielding [0, 1, 1], one computes the fourth number by summing the second and the third, yielding [0, 1, 1, 2], and so on.
# Define a method, #fibs, that accepts an integer as an argument. The method should return an array of the first n Fibonacci numbers.
# fibs(1) => [0]
# fibs(6) => [0, 1, 1, 2, 3, 5]
def fibs(n)
  return [0] if n == 1
  fibs = [0, 1]

  while fibs.length < n
    fibs << fibs[-2] + fibs[-1]
  end

  fibs
end

p fibs(1) => [0]
p fibs(6) => [0, 1, 1, 2, 3, 5]


# Return the argument with all its uppercase characters removed.
def destructive_uppercase(str)
  # your code goes here
  result = ""
  str.chars.each {|ch, i| result << ch if ch != ch.upcase}
  result
end
p destructive_uppercase("aBcDeFgH")

# Return the middle character of a string. Return the middle two characters if the word is of even length, e.g. middle_substring("middle") => "dd", middle_substring("mid") => "i"
def middle_substring(str)
  # your code goes here
  x = str.length

  if x % 2 == 1
    str[x/2]

  else str[x/2 - 1] + str[x/2]
  end
end
p middle_substring("abxxef")
p middle_substring("abcexfghi")

# Return the number of vowels in a string.
def num_vowels(str)
  # your code goes here

end

# Return the factoral of the argument (num!). A number's factorial is the product of all whole numbers between 1 and the number itself. Assume the argument will be > 0.
def factorial(num)
  # your code goes here
  # (1..num).reduce(:*)
  prod = 1

  i = 2
  while i <= num
    prod *= i
  i += 1
  end

prod
end

p factorial(6)


# MEDIUM

# Write your own version of the join method. separator="" ensures that the default argument is "".
def my_join(arr, separator="")
  # your code goes here
  arr.join(separator)

end
p my_join(["ax", "df", "lk", "uys"], separator="")

# Write a method that converts its argument to weirdcase, where every odd character is lowercase and every even is uppercase, e.g. weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  # your code goes here
  result = ""
  str.chars.each.with_index do |ch, i|
    if i.odd?
      result << ch.downcase
    else result << ch.upcase
    end

  end
  result
end
p weirdcase("precise")

# Reverse all words of five or more letters in a string. Return the resulting string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like my luck has desrever").
def reverse_five(str)
  # your code goes here

  result = []
  str.split.each do |word|
    if word.length >= 5
      result << word.reverse
    else result << word
    end
  end

  result.join(" ")
end
p reverse_five("Looks like my luck has reversed")

# Return an array of integers from 1 to 30 (inclusive), except for each multiple of 3 replace the integer with "fizz", for each multiple of 5 replace the integer with "buzz", and for each multiple of both 3 and 5, replace the integer with "fizzbuzz".
def fizzbuzz
  # your code goes here
  arr = Array.new
  (1..30).each do |i|

    if i % 15 == 0
      arr << "fizzbuzz"
    elsif
      i % 3 == 0
      arr << "fizz"
    elsif
      i % 5 == 0
      arr << "buzz"
    end
  end
  arr
end
p fizzbuzz

# HARD

# Write a method that returns a new array containing all the elements of the original array in reverse order.
def my_reverse(arr)
  # your code goes here
  result = Array.new
  i = arr.length - 1
  while i >= 0
    result << arr[i]
    i -= 1
  end

  result
end
p my_reverse([1,2,3,4,5])

# Write a method that returns a boolean indicating whether the argument is prime.
def prime?(num)
  # your code goes here
  arr = []
  i = 1
  while i <= num
    arr << i if num % i == 0
    i += 1
  end
  arr.length == 2
end
p prime?(7)
# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  # your code goes here
  result = Array.new
  i = 1
  until i == num
    result << i if num % i == 0
  i += 1
  end
  result
end

p factors(75)
p factors(19)
p factors(51)

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  # your code goes here
  prime_factors = []
    i = 1
    while i < num
    if num % i == 0 && helper(i)
      prime_factors << i
    end
    i += 1
  end
  prime_factors
end
#helper

def helper(x)
  arr = Array.new
  i = 1
  while i <= x
    arr << i if x % i == 0
  i += 1
  end
  arr.length == 2
end
p prime_factors(51)
p prime_factors(102)
p prime_factors(75)

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  # your code goes here
  result = 0
  i = 1
  while i < num
    result += 1 if num % i == 0 && helper(i)
  i += 1
  end

  result
end

#helper
def helper(x)
  arr = Array.new
  i = 1
  while i <= x
    arr << i if x % i == 0
  i += 1
  end
  arr.length == 2
end

p num_prime_factors(102)

# Return the one integer in an array that is even or odd while the rest are of opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  # your code goes here
  result = nil
  evens, odds = Array.new, Array.new
  i = 0
  while i < arr.length
    if arr[i].even?
      evens << arr[i]
    else odds << arr[i]
    end
  i += 1
  end

  if
    evens.length == 1
    result = evens.first
  else result = odds.first
  end

  result
end
p oddball([1,2,3]) => 2
p oddball([2,4,5,6]) => 5
