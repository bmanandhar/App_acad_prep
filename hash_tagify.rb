
# Hashtagify

# Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# in the original string and return the updated cool string with hashtags.

def hashtagify(sentence, tags)
  #
  # your code goes here
  # empty array as accumulator
  # split sentence into array and iterate looking for tags
  # delete any special character if present in word
  # concatenate '#' if tag-words found, accumulate in array
  # join array elements by " " and return 
  array = []
  sentence.split.each do |word|

    if tags.include?(word.downcase.delete(".!"))
      array << ("#" + word)

    else
      array << word
    end
  end
  array.join(" ")
end

puts "-------Hashtagify-------"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("Coding is fun!", ["coding", "fun"]) == "#Coding is #fun!"
puts hashtagify("Learned about coding.", ["coding"]) == "Learned about #coding."
