# ----------------- Read the solutions!
# Dependent Definitions
# ------------------------------------------------------------------------------
# Define a method, #dependent_definitions(dictionary, word), that accepts a hash and
# a string as arguments. The hash contains key-value pairs, where the key is a word
# and the value is the definition of that word. Both keys and values are strings.

# Your method should look up the definition of the provided word in the dictionary,
# and construct a new hash of only the dictionary entries that the provided word's
# definition depends on.

# EXAMPLE:

# dictionary = {
#   "apple" => "a tasty red fruit",
#   "fruit" => "tasty produce",
#   "pleasant" => "pure goodness",
#   "red" => "a pleasant color",
#   "tasty" => "pleasant when eaten"
# }

# Above, apple's definition depends on the words tasty, red, and fruit so...

# dependent_definitions(dictionary, "apple") ==
# {
#   "fruit" => "tasty produce",
#   "red" => "a pleasant color",
#   "tasty" => "pleasant when eaten"
# }

dictionary = {
  "apple" => "a tasty red fruit",
  "fruit" => "tasty produce",
  "pleasant" => "pure goodness",
  "red" => "a pleasant color",
  "tasty" => "pleasant when eaten"
}

def dependent_definitions(dictionary, word)
  result = dictionary.select do |entry, defn|
    dictionary[word].include?(entry)
  end
 result
end

puts "-------Dependent Definitions-------"
puts dependent_definitions(dictionary, "red") == {"pleasant" => "pure goodness"}
puts dependent_definitions(dictionary, "tasty") == {"pleasant" => "pure goodness"}
puts dependent_definitions(dictionary, "pleasant") == {}
puts dependent_definitions(dictionary, "apple") ==
  {
    "fruit" => "tasty produce",
    "red" => "a pleasant color",
    "tasty" => "pleasant when eaten"
  }
