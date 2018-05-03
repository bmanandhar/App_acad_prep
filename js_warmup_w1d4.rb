# Vowel Censor
# ----------------------------------------
# Write a method, #vowel_censor that takes in a string and replaces
# any vowels in it with an "X". Do not modify the original string.

def vowel_censor(string)

  string.tr('aeiou', 'X')
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
# method-1
def largest_factor(n)

  result = nil
  (1 .. n/2).each do |d|
    if n % d == 0
      result = d
    end
  end

  result
end

#method-2
def largest_factor(n)
  (n/2).downto(2) {|num| return num if n % num == 0}
  1
end

puts "---------Muni Routes----------"
puts largest_factor(10) == 5
puts largest_factor(143) == 13
puts largest_factor(27) == 9
puts largest_factor(17) == 1
