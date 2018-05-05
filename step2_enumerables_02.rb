# EASY

# Define a method that returns the sum of all the elements in its argument (an array of numbers).
def array_sum(arr)

  sum = 0
  arr.each {|n| sum += n}

  sum
end

# Define a method that returns a boolean indicating whether substring is a substring of all the long_strings (an array).
def in_all_strings?(long_strings, substring)
 long_strings.all?{ |el| el.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and returns an array of letters that occur more than once.
def non_unique_letters(string)

  result = [] # empty accumulator

  string.split("").uniq.each do |uni| # finding character present in the string
    each_char = 0

    string.split("").each do |ltr| # iterating array of string
      each_char += 1 if ltr == uni
    end
    result << uni if each_char > 1
  end

  result
end

# Define a method that returns an array of the longest two words (in order) in the method's argument. Ignore punctuation!

def longest_two_words(string)

  hsh = Hash.new # created hash-table as accumulator
  words = string.split # words split into an array

  words.each_index do |i| # data (word:length) structured to hsh
    word = words[i].delete('.,')
    hsh[word] = word.length
    end
  # finding of two longest words
  wrd1, wrd2 = "", ""
  val1, val2 = 0, 0

  hsh.each do |wrd, val|

    if val >= val2
      wrd2, wrd1 = wrd, wrd2
      val2, val1 = val, val2
    elsif val >= val1
      wrd1 = wrd
      val1 = val
    end

  end
  # result
  [wrd1, wrd2]
end


# MEDIUM

# Define a method that returns an array of letters that do not occur in the method's argument.
def missing_letters(string)
  alpha = ('a'..'z').to_a
  result = []

  i = 0
  while i < alpha.length
    if string.downcase.include?(alpha[i]) == false && result.include?(alpha[i]) == false
      result << alpha[i]
    end
    i += 1
  end

  result
end

# Define a method that accepts two years and returns an array of the years within that range (inclusive) that have no repeated digits. Hint: helper method?

def no_repeat_years(first_yr, last_yr)

  result = []
  (first_yr..last_yr).each do |year|
     str = year.to_s
     result << year if not_repeat_year?(str)
  end

  result
end

def not_repeat_year?(year)

  temp = year.split("").uniq
  return true if temp.length == year.length

end


# HARD

# Define a method that, given an array of songs at the top of the charts, returns the songs that only stayed on the chart for a week at a time. Each element corresponds to a song at the top of the charts for one particular week.
# Songs CAN reappear on the chart, but if they don't appear in consecutive weeks, they're "one-week wonders."
# Suggested strategy: find the songs that appear multiple times in a row and remove them.
# You may wish to write a helper method no_repeats?
def one_week_wonders(songs)
 songs.select{ |song| no_repeats?(song, songs)}.uniq
end

def no_repeats?(song_name, songs)
 songs.each_with_index do |song, idx|
   if song == song_name
     return false if songs[idx + 1] == song_name
   end
 end
 true
end



# Define a method that, given a string of words, returns the word that has the letter "c" closest to the end of it. If there's a tie, return the earlier word. Ignore punctuation. If there's no "c", return an empty string. You may wish to write the helper methods c_distance and remove_punctuation.
def for_cs_sake(string)

  hsh = Hash.new
  words = string.split

  words.each_index do |i|
    words[i].delete!('.')
    hsh[words[i]] = c_distance(words[i]) if words[i].include?('c')
    end

  key, value = "", nil
  hsh.each do |k, v|
    if value == nil
      key = k
      value = hsh[k]
    elsif hsh[k] > value
      value = hsh[k]
      key = k
    end
  end

  key
end
#helper
def c_distance(word)
  c_idx = nil
  i = 0
  while i < word.length
    c_idx = i if word[i] == 'c'
    i += 1
  end

  c_idx - word.length
end


# Define a method that, given an array of numbers, returns a nested array of two-element arrays that each contain the start and end indices of whenever a number appears multiple times in a row.
# repeated_number_ranges([1, 1, 2]) => [[0, 1]]
# repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]
def repeated_number_ranges(arr)

  result = []
  key = arr.uniq

  i = 0
  while i < key.length
    check, j = [], 0
    while j < arr.length
      if key[i] == arr[j]
        check << j
      end
      j += 1
    end
    if check.length > 1
      check = [check.first, check.last]
      result << check
    end
    i += 1
  end

  result
end


p "abcd".chars.count








#
