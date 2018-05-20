#05/18/2018 friday, 02:30 PM, interviewer: Paul
#01 (solo)
# all_unique
def all_unique(arr)

  result = []
  arr.each.with_index {|x, i| result << x if !(arr[0...i] + arr[i + 1..-1]).include?(x)}
  result
end

p "== == def all_unique(arr) == =="
p all_unique([1,2,7,1,8,9,10,7,18,2,1]) => [8, 9, 10, 18]

#
#02 (pair-programming), pascal-triangle
#### Pascal's Triangle ####
# This is an example of Pascal's Triangle:
#
#  depth
#    0   |      1
#    1   |     1 1
#    2   |    1 2 1
#    3   |   1 3 3 1
#    4   |  1 4 6 4 1
#
#
# Pascal's Triangle is a mathematical construct that follows a simple
# rule: each number in the triangle is the sum of the two numbers
# directly above-and-to-the-left and above-and-to-the-right of it.
#
# For example, to find the next row after [1,2,1]:
#
#         1       2       1
#
#     1       3       3       1
#     |       |       |       |
#  (0 + 1) (1 + 2) (2 + 1) (1 + 0)
#
#
# Write a function that will return Pascal's Triangle at the given
# depth. The triangle should be represented as an array of rows.
#
# pascals_triangle(0) => [[1]]
# pascals_triangle(2) => [[1], [1,1], [1,2,1]]
# pascals_triangle(4) => [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1]]

def pascals_triangle(depth)
  # all arrays have 1's in common as the first and last items, except array at (0)
  # do not think like you are working to derive solution/s to an algebraic equation
  # if you look at the test cases (especially, the case when depth is 4),
  # it's clear that each array is derrived from the items of previous array
  # each item is the sum of items at indices (i - 1) and and (i),
  # except the items at indices (0) and (-1)
  # hence we can imagine of a logic that will add 1 as items at (0) and (-1) always
  triangle = [[1]]
  while triangle.length <= depth
    triangle << next_row(triangle.last)
  end
  triangle
end
#helper
def next_row(arr)
  temp = [1]
  i = 0
  while i < arr.length
    temp << arr[i - 1] + arr[i]
  i += 1
  end

  temp << 1
end
p pascals_triangle(0) => [[1]]
p pascals_triangle(2) => [[1], [1,1], [1,2,1]]
p pascals_triangle(4) => [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1]]

#03 (solo)
# next_prime in the array
def next_prime?(arr)
  result = []
  i = 0
  while i < arr.length
    if prime?(arr[i])
      result << prime_next(arr[i])
    end
  i += 1
  end
  result
end
#helper-1
def prime?(n)
  arr = []
  i = 1
  while i <= n
    arr << i if n % i == 0
    i += 1
  end
  arr.length == 2
end

#helper-2
def prime_next(x)
  i = x + 1
  while !prime?(i)
    i += 1
  end
  i
end
p "=====next prme===="
p next_prime?([3, 7, 17]) => [5, 11, 19]
p next_prime?([4, 8, 18]) => []
p next_prime?([19, 5, 20, 31, 4]) => [23, 7, 37]
