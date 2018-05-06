# Define a method that accepts two arguments, a string and an integer. The method should return a copy of the string with the letter at the nth index removed.
def remove_nth_letter(string, n)

  splits = string.chars
  splits.delete_at(n)
  splits.join("")

end

# Define a method that chunks an array into a nested array of sub-arrays of length n. The last array may be of length less than n if the original array's size does not divide evenly by n.
# chunk([1,2,3,4,5], 2) => [[1,2], [3,4], [5]]

def chunk(array, n)
  result = []
  array.each_slice(n).each {|el| result << el}

  result
end

# Define a method that multiplies the frequencies of the periods, commas, hyphens, semicolons, question marks, and exclamation points in a given string and returns the product. If any punctuation does not occur, don't include it in the product, i.e., don't multiply by zero!
def product_punctuation(str)

  freq_arr = []
  letters = str.chars
  punctuation = ".,-;?!".split("")
  punctuation.each do |ch|
    freq_arr << letters.count(ch) if letters.count(ch) != 0
    end
  freq_arr.reduce(:*)
end

# Translate a sentence into pig-latin! The first consonants go to the end of the word, then add "ay".
def pig_latin(sentence)
  #empty array created for all words processed at 'helper' method

  array = []
  sentence.split(" ").each do |word|
    array << single_word(word)
    end

  array.join(" ")
end

#helper
def single_word(word)
  vowels = "aeiouAEIOU"

  if vowels.include?(word[0])
    word += "ay"

  elsif word[0] == "s"
    word = word + word[0, 2] + "ay"
    word[0,2] = ""

  elsif word[0] == "t"
    word += word[0, 3] + "ay"
    word[0,3] = ""

  else
    word += word[0] +"ay"
    word[0] = ""
  end

  word
end
