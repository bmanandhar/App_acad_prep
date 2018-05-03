# Pizza Slices
# ----------------------------------------
# You are cutting a gigantic pizza. Given the circumference of the pizza
# and the length of the crust of each slice, return the exact number
# (i.e. potentially including a partial slice up to three decimal places)
# of slices you can cut from that pizza.

def pizza_slices(circumference, crust_length)
  (circumference.to_f / crust_length).round(3)
end

# puts "---------Pizza Slices----------"
# puts pizza_slices(100, 3) == 33.333
# puts pizza_slices(30, 4) == 7.5
# puts pizza_slices(5000, 135) == 37.037

# ----------------- Switch Roles!
# Identify This
# ----------------------------------------
# Define a method, #identify_this(obj), that accepts any object as an argument!
# Your method should return a string that identifies the type of object in the
# following format:
#   "This ruby object is a _______!"
# Hint, use the #class method to identify objects. Test this method in the repl!

def identify_this(obj)
  if obj.class == Integer
    "This ruby object is an #{obj.class}!"
  else
    "This ruby object is a #{obj.class}!"
  end
end

puts "---------Identify This----------"
puts identify_this(100) == "This ruby object is an Integer!"
puts identify_this("ruby") == "This ruby object is a String!"
puts identify_this(1.0) == "This ruby object is a Float!"
puts identify_this([]) == "This ruby object is a Array!"
