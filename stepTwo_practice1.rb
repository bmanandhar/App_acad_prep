# Anagrams are two words with exactly the same letters. Order does not matter. Define a method that, given two strings, returns a boolean indicating whether they are anagrams.
def anagrams?(str1, str2)
  str1.split('').sort == str2.split('').sort

end

# An isogram is a word of only non-repeating letters. Define a method that, given two isograms of the same length, returns an array of two elements indicating matches: the first number is the number of letters matched in both words at the same position, and the second is the number of letters matched in both words but not in the same position.
def isogram_matcher(isogram1, isogram2)

  x = 0 # no. of matching letters with matching indices
  y = 0 # no. of matching letters but unmatched indices

  isogram1.split("").each_with_index do |ch1, i|

    x += 1 if ch1 == isogram2[i]

    isogram2.split("").each_with_index do |ch2, j|
      y += 1 if (ch1 == ch2 && i != j)
      end
    end
  [x, y]
end

# You have a panoramic view in front of you, but you only can take a picture of two landmarks at a time (your camera is small). You want to capture every pair of landmarks that are next to each other. Define a method that, given an array of landmarks, returns an array of every adjacent pair from left to right. Assume the panorama wraps around.
def panoramic_pairs(landmarks)
  pano_pairs = []

  landmarks.each_with_index do |pan, i|
    land_pair = []
    land_pair << landmarks[i] << landmarks[i+1]
    land_pair[1] = landmarks[0] if land_pair[1] == nil
    pano_pairs << land_pair
    end

  pano_pairs
end

# Xbonacci

# Define a Xbonacci method that works similarly to the fibonacci sequence.
# The fibonacci sequence takes the previous two numbers in the sequence and adds
# them together to create the next number.
#
# First five fibonacci numbers = [1, 1, 2, 3, 5]
# The fourth fibonacci number (3) is the sum of the two numbers before it
# (1 and 2).
#
# In Xbonacci, the sum of the previous X numbers (instead of the previous 2 numbers)
# of the sequence becomes the next number in the sequence.
#
# The method will take two arguments: the starting sequence with X number of
# elements and an integer N. The method will return the first N elements in the given
# sequence.
#
# xbonacci([1, 1], 5) => [1, 1, 2, 3, 5]
# xbonacci([1, 1, 1, 1], 8) => [1, 1, 1, 1, 4, 7, 13, 25]
#
# X is the length of the starting sequence.
#
# number_of_xbonacci_numbers_to_return is the same as N.

def xbonacci(starting_sequence, number_of_xbonacci_numbers_to_return)

  len = starting_sequence.length
  result = starting_sequence

  while result.length < number_of_xbonacci_numbers_to_return

    i, sum = 1, 0
    while i <= len
      sum += result[-i]
      i += 1
    end
    result << sum
  end

  result
end
