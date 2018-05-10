def number_counting_seq(n)
  return "" if n < 1
  output_arr = ["1"]

  (n - 1).times do
    last_num = output_arr.last
    count = 0
    next_num = []
    start_digit = last_num[0]

    last_num.chars.each do |current_digit|
      if current_digit == start_digit
        count += 1
      else
        next_num << count
        next_num << start_digit
        start_digit = current_digit
        count = 1
      end
    end
    next_num << count
    next_num << start_digit
    output_arr << next_num.join
  end
  p output_arr
  output_arr.last
end


puts "-------Number Counting Sequence-------"
puts number_counting_seq(0) == ""
puts number_counting_seq(1) == "1"
puts number_counting_seq(2) == "11" # one 1 above
puts number_counting_seq(3) == "21" # two 1s above
puts number_counting_seq(5) == "111221" #the last sequence was one 1, one 2, and two 1s: "1211"
puts number_counting_seq(8) == "1113213211"
puts number_counting_seq(10) == "13211311123113112211"
