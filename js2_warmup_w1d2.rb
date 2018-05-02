def vowel_censor(string)

  result = ""
  vowels = "aeiou"

  string.chars.each do |ch|
    if vowels.include?(ch)
      result << "X"
    else
      result << ch
    end
  end

  result
end

puts "---------Vowel Censor----------"
puts vowel_censor("Let's order a pizza") == "LXt's XrdXr X pXzzX"
puts vowel_censor("Nitwit, blubber, oddment, tweak") == "NXtwXt, blXbbXr, XddmXnt, twXXk"
puts vowel_censor("Supercalifragilisticexpialidocious") == "SXpXrcXlXfrXgXlXstXcXxpXXlXdXcXXXs"

# ----------------- Switch Roles!

def array_print_10

  numbers = [0,1,2,3,4,5,6,7,8,9]
  numbers.each do |num|
    puts num
  end

end
array_print_10
# Test your method by calling it! Type "array_print_10" below:
# YOUR TEST HERE

# Write a method, #range_print_10, that prints the numbers 0 - 9 using a range
# and the each method. Remember to test your method by calling it.

def range_print_10

  (0..9).each do |num|
    puts num
  end

end
range_print_10
# Write a method, #integer_print_10, that prints the numbers 0 - 9 using an integer
# and the times method. Remember to test your method by calling it.

def integer_print_10

  10.times {|i| p i}
end


# ----------------- Read the solutions!
