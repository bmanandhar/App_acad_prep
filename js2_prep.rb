# all?, none?, any?, each
def all_even?(arr)
  arr.each {|int| return false if int.odd?}
true
end
p all_even?([2, 4,-4, 0]) == true
p all_even?([1, 4, 0, 9, -2]) == false
#===

def all_even?(arr)
  arr.all? {|int| int.even?}
end
p all_even?([2,-4, 12]) == true
p all_even?([-1, 0, 8, 2]) == false
#===

def none_even?(arr)
  arr.none?{|int| int.even?}
end
p none_even?([1, 3, -5]) == true
p none_even?([4, -8, 0, 2]) == false

# map
simpleton = [1, 2, 3]
simpleton.map {|int| int*2} #=>[2, 4, 6]
p simpleton == [1, 2, 3] #=>true

#please note following
less_simpleton = [1, 2, 3]
less_simpleton.map! {|int| int**2} #=> [1, 4, 9]
p less_simpleton

# count
[1, 2, 3, 4, 5].count #=> 5
[1, 2, 3, 4, 5].count(2) #=> 1
[1, 2, 3, 4, 5].count{|int| int.odd?} #=> 3

# select
array_of_terms = ["The blab of the pave", "tires of carts",
      "sluff of boot-soles", "talk of the promenaders",
      "The heavy omnibus", 'the driver with his interrogating thumb']

  array_of_terms.select {|t| t.length > 20} #=> ["talk of the promenaders", "the driver with his interrogating thumb"]
  array_of_terms.reject {|t| t.length > 20} #=> ["The blab of the pave", "tires of carts", "sluff of boot-soles",
                                            #    "The heavy omnibus"]
  # WELCOME TO THE DANGER ZONE
  array_of_terms.select! {|t| t.length > 20} #=> ["talk of the promenaders", "the driver with his interrogating thumb"]
  array_of_terms #=> ["talk of the promenaders", "the driver with his interrogating thumb"]

# sort_by
def words_by_length(str)
  words = str.split
  words.sort_by {|word| word.length}
end

poor_gregor = "As Gregor Samsa awoke one morning from uneasy dreams he found
              himself transformed in his bed into a gigantic insect"

words_by_length(poor_gregor) #=> ["a", "As", "he", "in", "his", "one", "bed",
                             #    "into", "from", "found", "Samsa", "awoke",
                             #    "insect", "Gregor", "dreams", "uneasy",
                             #    "morning", "himself", "gigantic", "transformed"]

 #each_with_index and with_index
 three_lines = ["The", "mind", "has", "shown", "itself", "at", "times",
  "Too", "much", "the", "baked", "and", "labeled", "dough",
  "Divided", "by", "accepted", "multitudes."]

three_lines.each_with_index do |word, idx| #the parameters are comma separated and in order
  if word == word.capitalize
    puts "The word at index #{idx} must be the start of a new line!"
  end
end

back_to_the_numbers_game = [1, 2, 3]
back_to_the_numbers_game.map.with_index {|num, i| num - i} #=> [1, 1, 1]

"abcd".each_char.with_index {|ch, i| puts "#{ch} is letter number #{i + 1} in the alphabet!"} #=> "abcd" (returns receiver)

# count
#helper method
def num_vowels(word)
  vowels = ["a", "e", "i", "o", "u"]
  word.chars.count {|ch| vowels.include?(ch.downcase)}
end

def order_by_num_vowels(str)
  words = str.split
  words.sort_by {|word| num_vowels(word)}
end
order_by_num_vowels("Miracle bird or golden handiwork")
# => ["bird", "or", "golden", "Miracle", "handiwork"]

# reduce
[1, 2].reduce(:+) #=> 3
[1, 2].reduce(:*) #=> 2

[1, 2, 3].reduce(:+) #=> 6
[1, 2, 3].reduce(:*) #=> 6

[1.0, 2.0, 3.0].reduce(:/) #=> 0.16666666666666666
[3.0, 2.0, 1.0].reduce(:/) #=> 1.5


def my_sum(arr)
  accumulator = arr.first # store first element as accumulator

  arr.each_index do |idx|
    next if idx == 0 # skip element: it's already the accumulator
    accumulator += arr[idx] # increment accumulator by current element
  end

  accumulator
end

# With a Block, Without an Argument
[1, 2, 3].reduce(:+)
[1, 2, 3].reduce {|acc, el| acc + el}

def sum_first_and_odds(arr)
  arr.reduce do |acc, el|
    if el.odd?
      acc + el
    else
      # this else statement is necessary because otherwise the return value of
      # the block would be nil if the element is even. Thus the interpreter
      # would reassign acc to nil.
      acc
    end
  end

end
sum_first_and_odds([1, 2, 4, 5]) #=> 1+5=> 6

# OLD SOLUTION
def longest_word(str)
  words = str.split
  longest_word = ""

  words.each do |word|
    if word.length > longest_word.length
      longest_word = word
    end
  end

  longest_word
end

# REDUCED EXCELLENCE
def longest_word(str)
  str.split.reduce do |longest, word|
    if word.length > longest.length
      word
    else
      longest
    end
  end

end
p longest_word("this is a test string")

# With a Block, With an Initial Accumulator
def e_words(str)
  words = str.split
  count = 0

  words.each do |word|
    count += 1 if word[-1] == "e"
  end

  count
end

# same thing using 'reduce' method
def e_words(str)
  str.split.reduce(0) do |count, word|
    if word[-1] == "e"
      count + 1
    else
      count
    end
  end

end
# this function func will return 3.
p e_words("eric, take the circle.")

# OLD SOLUTION
def boolean_to_binary(arr)
  binary = ""

  arr.each do |boolean|
    if boolean
      binary += "1"
    else
      binary += "0"
    end
  end

  binary
end

# REDUCE EXCELLENCE
def boolean_to_binary(arr)
  arr.reduce("") do |str, boolean|
    if boolean
      str + "1"
    else
      str + "0"
    end
  end
end

# OLD SOLUTION
def factors(num)
  factors = []
  (1..num).each do |i|
    if num % i == 0
      factors << i
    end
  end
  factors
end

# REDUCED EXCELLENCE
def factors(arr)
  (1..num).reduce([]) do |factors, i|
    if num % i == 0
      factors << i
    else
      factors
    end
  end
end
