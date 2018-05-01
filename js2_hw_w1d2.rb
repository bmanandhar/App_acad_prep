=begin
Instructions from your teacher:
Compound Words

Define a method, #compound_words?(word_list, target), that accepts 2 arguments:
an array of words and a target, compound word. Check to see if any two words
in the list can be combined to make the compound word. Don't double-use words.
=end
def compound_words?(array, target)
#
# your code here
# using a 'while' loop
  i = 0
  while i < array.length - 1
    j = i + 1
    while j < array.length
    if target == array[i] + array[j] ||
      target == array[j] + array[i]
      return true
    end
      j += 1
    end
    i += 1
  end

  false
end

####
def compound_words?(array, target)
 #
 # your code here
# using 'each' loop
  array.each_index do |i|
    subarray = array[0...i] + array[i+1..-1]
    subarray.each do |word|
      if target == array[i] + word ||
        target == word + array[i]
        return true
      end
    end
  end

  false
end

puts "------Compound Words------"
puts compound_words?(["ice", "cream"], "icecream") == true
puts compound_words?(["cake", "candle", "cup", "wish"], "cupcake") == true
puts compound_words?(["hello", "bye", "greetings"], "byebye") == false
puts compound_words?(["bye", "bye", "greetings"], "byebye") == true
