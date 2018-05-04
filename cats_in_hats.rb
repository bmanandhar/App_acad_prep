# You have 100 cats (You are quite lucky to own so many cats!).
# You have arranged all your cats in a line. Initially, none of your
# cats have any hats. You take 100 rounds walking around the cats,
# always starting with the first cat. Every time you stop at a cat,
# you put a hat on it if it doesn't have one, and you take itshat off if it has one on.

# The first round, you stop at every cat. The second round, you only
# stop at every 2nd cat (#2, #4, #6, #8, etc.). The third round, you
# only stop at every 3rd cat (#3, #6, #9, #12, etc.). You continue this
# process until the 100th round (i.e. you only visit the 100th cat).

# Write a program that prints which cats have hats at the end.


def cats_in_hats
  # Build data structure of cats (cat# 1 thru cat# 100)
  cats = Array.new(100, false)
  # Loop through 100 rounds
  # Toggle hat of the cat# equal to round#
  (1..100).each do |round|

    i = round - 1 # Index starts 0, but round starts 1
    while i < cats.length
      cats[i] = !cats[i]
      i += round
    end

  end
# Find the cats with hats
  cats_with_hats = []
  i = 0
  while i < cats.length
    cats_with_hats << i+1 if cats[i] # Cat# 1 is of i=0
    i += 1
  end

  cats_with_hats
end

p cats_in_hats
