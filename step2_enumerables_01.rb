# EASY

# Define a method that returns an array of only the even numbers in its argument (an array of integers).
def get_evens(arr)
  array = []
  arr.each do |x|
    array << x if x.even?
  end
  array
end

# Define a method that returns a new array of all the elements in its argument doubled. This method should *not* modify the original array.
def calculate_doubles(arr)
  array = []
  arr.each {|x| array << x + x}
  array

end

# Define a method that returns its argument with all the argument's elements doubled. This method should modify the original array.
def calculate_doubles!(arr)

  arr.map! {|x| x + x}
  arr

end

# Define a method that returns the sum of each element in its argument multiplied by its index.
# array_sum_with_index([2, 9, 7]) => 23 because (2 * 0) + (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23
def array_sum_with_index(arr)
  sum = 0
  i = 0
  while i < arr.length
    sum += arr[i]*i

    i += 1
  end

  sum
end
#Method-2 using enumerable

def array_sum_with_index(arr)

  result = []
  arr.each_index {|i|  result << arr[i]*i}
  result
end

# MEDIUM

# Given an array of bids and an actual retail price, return the bid closest to the actual retail price without going over that price. Assume there is always at least one bid below the retail price.
def price_is_right(bids, actual_retail_price)

  bid = bids[0]
  diff1 = actual_retail_price - bids[0]

  i = 0
  while i < bids.length
    diff = actual_retail_price - bids[i]

    if diff > 0 && diff <= diff1
      bid = bids[i]
      diff1 = diff
    end

    i += 1
  end

  bid
end

# Given an array of numbers, return an array of those numbers that have at least n factors (including 1 and the number itself as factors).
# at_least_n_factors([1, 3, 10, 16], 5) => [16] because 16 has five factors (1, 2, 4, 8, 16) and the others have fewer than five factors.
# Consider writing a helper method num_factors
def at_least_n_factors(numbers, n)

  arr = []
  numbers.each do |x|
    arr << x if num_factors(x) >= n
    end

  arr
end

def num_factors(number)

  arr = []
  (1..number).each do |n|
    arr << n if number % n == 0
    end

  arr.length
end


# HARD

# Define a method that accepts an array of words and returns an array of those words whose vowels appear in order. You may wish to write a helper method: ordered_vowel_word?
def ordered_vowel_words(words)

  result = []
  words.each do |word|
    result << word if ordered_vowel_word?(word)
    end

  result
end

def ordered_vowel_word?(word)

  vowels = "aeiou"
  arr = []
  x = word.split("")

  x.each do |c|
    arr << c if vowels.include?(c.downcase)
    end

  arr == arr.sort
end

# Given an array of numbers, return an array of all the products remaining when each element is removed from the array.
# You may wish to write a helper method: array_product.

# products_except_me([2, 3, 4]) => [12, 8, 6], where:
#   12 because you take out 2, leaving 3 * 4
#   8, because you take out 3, leaving 2 * 4
#   6, because you take out 4, leaving 2 * 3

# products_except_me([1, 2, 3, 5]) => [30, 15, 10, 6], where:
#   30 because you take out 1, leaving 2 * 3 * 5
#   15, because you take out 2, leaving 1 * 3 * 5
#   10, because you take out 3, leaving 1 * 2 * 5
#   6, because you take out 5, leaving 1 * 2 * 3
def products_except_me(numbers)

  result = []
  numbers.each_index do |i|
    subarr = numbers[0...i] + numbers[i+1..-1]
    result << array_product(subarr)

    end
  result
end

def array_product(array)

  prod = 1
  array.each do |n|
    prod *= n
    end

  prod
end
