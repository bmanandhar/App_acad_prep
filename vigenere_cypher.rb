# Vigenere Cipher

# Vigenere's Cipher is a tool for encrypting strings. We'll offset each character
# according to a key sequence. For example, if we encrypt "bananasinpajamas" with the
# key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
#
# Word:   b a n a n a s i n p a j a m a s
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Cipher: c c q b p d t k q q c m b o d t
#
# Note that offsets should wrap around the alphabet - offsetting 'z' by 1 should
# produce 'a'. It could wrap the around the alphabet n number of times;
# for example, 100 times.
#
# Write a method that takes a string and a key-sequence, returning
# the encrypted word. Assume only lower-case letters are used.

# We're giving you the alphabet as an array, don't modify it!
# ------------------------------------------------------------------------------

def vigenere_cipher(string, key_sequence)
  result = ""
  #
  # your code goes here
  #
  i = 0
  while i < string.length
    j = 0
    while j < key_sequence.length
      index = i + j
      break if index >= string.length
      new_ch = alpha_shift(string[i + j], key_sequence[j])
      result << new_ch
      j += 1
    end
    i += key_sequence.length
  end
  result

end

def alpha_shift(ch, num)
	alphabet = ("a".."z").to_a
  #
  # your code goes here
  #
  cur_idx = alphabet.index(ch)
  new_idx = cur_idx + num
  if new_idx > 25
    new_idx -= 26
  end
    new_ch = alphabet[new_idx]
end


puts "----Vigenere cipher----"
puts vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
puts vigenere_cipher("toarrispirate", [1, 2, 3, 4]) == "uqdvskvtjtdxf"
puts vigenere_cipher("zzz", [1, 2, 1]) === "aba"
