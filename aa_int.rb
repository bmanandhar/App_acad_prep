# INSTRUCTIONS]### INSTRUCTIONS
#
# Welcome to the App Academy technical interview. The interview consists
# of three programming questions of the following 2 types:
#
# 2 Solo Programming
# 1 Pair Programming
#
# You will be allotted 15 minutes for each solo programming question.
# Keep in mind, we accept partial solutions, and overall logic is more
# important to us than perfect syntax, so try not to stress if your
# solution is incomplete or imperfect. Take a deep breath and focus on
# your approach to the next problem.
#
# In pair programming, two programmers work together as they alternate
# between two distinct roles. The DRIVER types at the keyboard, while
# the NAVIGATOR instructs the driver what to type. For this interview,
# we will alternate roles halfway through the pairing problem, to give
# you a chance to both drive and navigate.
#
# The key in both solo and pair programming is communication. We want to
# get a better idea of how you think, so aim to give us a detailed
# explanation of your approach to each problem. We understand that some
# people prefer to talk while they come to a solution, while others
# prefer to walk us through after they've done a bit of work. Either way
# is fine.
#
# We want to evaluate you on your own work, so the interview is
# closed-book. Please do not consult any outside sources: that includes
# other programmers, the internet, and any notes / code you may have
# written previously. Don't run your code in any REPL or interpreter,
# and don't share these questions or your solutions with anyone else.
#
# That said, you may ask your interviewer any questions you may have. We
# are more than happy to help clarify the question or let you know the
# right syntax for the language you're using.
#
# Good luck!

### Cats 'n Hats ###
      # You have 100 cats (You are quite lucky to own so many cats!).

      # You have arranged all your cats in a line. Initially, none of your cats
      # have any hats. You take 100 rounds walking around the cats, always starting
      # at the beginning. Every time you stop at a cat, you put a hat on it if it
      # doesn't have one, and you take its hat off if it has one on.

      # The first round, you stop at every cat. The second round, you only stop at
      # every 2nd cat (#2, #4, #6, #8, etc.). The third round, you only stop at
      # every 3rd cat (#3, #6, #9, #12, etc.). You continue this process until the
      # 100th round (i.e. you only visit the 100th cat).

      # Write a program that prints which cats have hats at the end.

def cats

end



#### Unique Items ####
# Write a function that takes in an array. It should return a new array
# containing only the elements that were unique in the original array.
#
# For example:
# ary = [1, 5, 5, 7, 16, 8, 1, 8]
# unique = unique_items(ary)
# unique # => [7, 16]


#input=  array containing random elements
    #declare new array
    #go through the given array,
    #if the element only appears once, push it into new array
# output = new array that only contains the elements that appear once

def unique_items(array)
end



#### Next Prime ####
# Given an array of numbers, replace each prime number in the array with
# the next prime number, e.g. 7 is replaced by 11.
#
# examples:
# next_prime([11,13,17]) #=> [13, 17, 19]
# next_prime([4,6,8,10]) #=> [4,6,8,10]
# next_prime([2,5,4,7]) #=> [3,7,4,11]

=begin
- write a method to check prime or not
- if not prime, accumulator
- if prime, another helper
=end
def next_prime(numbers)
  result = []
  numbers.each do |num|
    if prime?(num) #helper1
      result << next_prime?(num) #helper2
    else
      result << num
    end
  end
  result
end
#helper1
def prime?(num)
  arr = []
  i = 1
  while i <= num
    arr << i if num % i == 0
    i += 1
  end
  arr.length == 2
end
#helper2
def next_prime?(num)
  i = num + 1
  while prime?(i) == false
    prime?(i)
    i += 1
  end
  i
end
p next_prime([11,13,17]) == [13, 17, 19]
p next_prime([4,6,8,10]) == [4,6,8,10]
p next_prime([2,5,4,7]) == [3,7,4,11]
