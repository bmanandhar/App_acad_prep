=begin
Define a method that accepts two arguments, a string and an integer.
The method should return a copy of the string with the letter at
the nth index removed.
=end
def remove_nth_letter(string, n)

  splits = string.chars
  splits.delete_at(n)
  splits.join("")

end
=begin
Define a method that chunks an array into a nested array
of sub-arrays of length n.
The last array may be of length less than n
if the original array's size does not divide evenly by n.
# chunk([1,2,3,4,5], 2) => [[1,2], [3,4], [5]]
=end
def chunk(array, n)
  result = []
  array.each_slice(n).each {|el| result << el}

  result
end
=begin
Define a method that multiplies the frequencies of
the periods, commas, hyphens, semicolons, question marks,
and exclamation points in a given string and returns the product.
If any punctuation does not occur, don't include it in the product,
i.e., don't multiply by zero!
=end
def product_punctuation(str)

  freq_arr = []
  letters = str.chars
  punctuation = ".,-;?!".split("")
  punctuation.each do |ch|
    freq_arr << letters.count(ch) if letters.count(ch) != 0
    end
  freq_arr.reduce(:*)
end
=begin
Translate a sentence into pig-latin!
The first consonants go to the end of the word,
then add "ay".
=end
def pig_latin(sentence)
  #array created for words processed at 'helper' method
  array = []
  sentence.split(" ").each do |word|
    i = vindex(word)
    array << word[i..-1] + word[0...i] + "ay"
    end
  array.join(" ")
end

#helper
def vindex(word)
  vowels = "aeiou"
  vindex = word.downcase.chars.index {|ch| vowels.include?(ch)}
end
