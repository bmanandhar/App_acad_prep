### Missing Numbers
#
# Given an array of unique integers ordered from least to greatest, write
# a method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  result = []

  (nums.first..nums.last).each do |x|

    if nums.include?(x) == false
      result << x
    end
  end

    result
  end

puts "-------Missing Numbers-------"
puts missing_numbers([1, 3]) == [2]
puts missing_numbers([2, 3, 7]) == [4, 5, 6]
puts missing_numbers([-5, -1, 0, 3]) == [-4, -3, -2, 1, 2]
puts missing_numbers([0, 5]) == [1, 2, 3, 4]

### Titleize
#
# Write a method that capitalizes each word in a string like a book title.
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.

def titleize(title)

  result = []

  excluded = ['a', 'and', 'of', 'over', 'the']
  arr = title.split

  arr.each_index {|i|
  if excluded.include?(arr[i]) && i != 0
    result << arr[i]
  else
    result << arr[i].capitalize
  end
  }

  result.join(" ")
end

puts "-------Titleize-------"
puts titleize("basketball") == "Basketball"
puts titleize("stephen curry") == "Stephen Curry"
puts titleize("war and peace") == "War and Peace"
puts titleize("the bridge over the river kwai") == "The Bridge over the River Kwai"

# Unique in Order
#
# Implement the function unique_in_order which takes a string and
# returns an array of letters without any elements with the same value next
# to each other. Preserve the original order of elements.

def unique_in_order(string)
  string.each_char.with_index.reduce([]) do |arr, (el, i)|
    if el == string.chars[i+1]
      arr
    else
      arr << el
    end
  end
end


# using "while" loop

def unique_in_order(string)
  str =[string[0]]

  i = 1
  while i < string.length
    if string[i] != string[i-1]
      str << string[i]
     end

    i += 1
  end

  str
end

puts "-------Unique in Order-------"
puts unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
puts unique_in_order('BBBAAAACCDAABBB') == ['B', 'A', 'C', 'D', 'A', 'B']
puts unique_in_order('ABBCcAD') == ['A', 'B', 'C', 'c', 'A', 'D']
puts unique_in_order('aAa') == ['a', 'A', 'a']

# Substrings
#
# Return an array of all the substrings for a given string.
# Be sure that the returned array is sorted.

def substrings(string)
  subs = []

  (0...string.length).each do |i|
    (i...string.length).each do |j|
      subs << string[i..j]
    end
  end
  subs.sort
end

#using "while" loop

def substrings(string)
  subs = []
  i = 0
  while i < string.length
    j = i
    while j < string.length
      subs << string[i..j]
      j += 1
    end
    i += 1
  end

  subs.sort
end

puts "-------Substrings-------"
puts substrings("") == []
puts substrings("123") == ["1", "12", "123", "2", "23", "3"]
puts substrings("ruby") == ["b", "by", "r", "ru", "rub", "ruby", "u", "ub", "uby", "y"]
