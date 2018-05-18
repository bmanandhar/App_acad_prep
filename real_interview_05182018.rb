#05/18/2018 friday, 02:30 PM, interviewer: Paul
#01 (solo)
# all_unique
def all_unique(arr)

  result = []

  arr.each.with_index do |x, i|
    subarr = arr[0...i] + arr[i + 1..-1]

    if result.include?(x) == false && subarr.include?(x) == false
      result << x
    end
  end
  result
end

p "== == def all_unique(arr) == =="
p all_unique([1,2,7,1,8,9,10,7,18,2,1]) => [8, 9, 10, 18]

#
#02 (pair-programming), pascal-triangle
#


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
p next_prime?([3, 20, 17]) => [5, 19
