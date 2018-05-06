# Define a method that returns a boolean indicating whether its second argument is a substring of its first.
def substring?(long_string, short_string)

  return true if long_string.include?(short_string)

  false
end

# Write a method that, given a string, returns a hash in which each key is a character in the string and each value is an array of the first and last indices where that character occurs. If the character occurs only once, the array should contain a single index. Consider defining helper methods.
# first_last_indices("banana") => {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
def first_last_indices(str)

  hash = Hash.new
  alpha = ""
  # create array of individual characters(equivlent uniq-method)
  i = 0
  while i < str.length
    alpha += str[i] if alpha.include?(str[i]) == false
    i += 1
  end

  # traversing thru string to check indices of all characters
  i = 0
  while i < alpha.length
  indices = []
    j = 0
    while j < str.length
      indices << j if alpha[i] == str[j]
      j += 1
    end

    if indices.length == 1
      hash[alpha[i]] = indices
    else
      hash[alpha[i]] = [indices[0], indices[-1]]
    end
    i += 1
  end

  hash
end

# Define a method that returns the number of times that two adjacent numbers in an array sum to n. Don't reuse numbers.
# count_adjacent_sums([1, 5, 1, 3, 3], 6) => 2
def count_adjacent_sums(array, n)

  occurs = 0
  i = 1
  while i < array.length - 1
    if array[i] + array[i-1] == n || array[i] + array[i+1] == n
      occurs += 1
    end
    i += 2
  end
  occurs
end
