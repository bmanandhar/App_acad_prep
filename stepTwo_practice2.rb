# Given an array of words, remove all the occurrences of the letter 'a' in those words and return the resulting array.

def remove_letter_a(words)
  words.each do |el|
    el.delete!("a")
    el
  end

end

# An abundant number is less than the sum of its divisors, not including itself. 12's divisors are 1, 2, 3, 4, 6, which sum to 16. xw16 > 12 so 12 is an abundant number.
# Write a method that, given a number, returns a boolean indicating whether that number is abundant.
def abundant?(num)
  #divisors can not be larger than number/2
  arr = []
  (1..num/2).map {|x| arr << x if num % x == 0}

  arr.reduce(:+) > num
end

# Return the greatest number that's a factor of both inputs.
# greatest_common_factor(6, 10) => 2
# greatest_common_factor(10, 15) => 5

def greatest_common_factor(first_number, second_number)
  result = nil
  (1..first_number/2).each do |x|
    if first_number % x == 0 && second_number % x == 0
      result = x
    end
  end

  result
end

# Write a method that, given a sentence without punctuation or capitalization, returns the word with the greatest number of repeated letters. Return the first word if there's a tie. It doesn't matter how often individual letters repeat, just that they repeat.
# word_with_most_repeats("I took the road less traveled and that has made all the difference") => "difference" because "difference" has two repeated letters, more than the other words.

def word_with_most_repeats(sentence)
  #variables 'result' & 'occurs' for comparing/storing
  #helper method used for counting and selecting
  #'result' replaced if following chars win/supercede
  #split sentence into words
  result, occurs = "", 0
  sentence.split.each do |word|
    if counter(word) > occurs
      result, occurs = word, counter(word)
    end
  end
  result
end
#helper
def counter(word)
  counter = 0
  word.chars.uniq.each do |x|
    counter += 1 if word.chars.count(x) > 1
  end
  counter
end 
