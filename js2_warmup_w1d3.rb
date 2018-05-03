#Pair-Programing

=begin
Muni Routes
You are at a busy intersection and need to get to brunch ASAP.
Thereare multiple Muni buses that go by, but you don't know which
to take.Given a hash of routes (with route number as the key and
next stop on the route as the value) return the number of the
first route in the hash that could get you to your brunch spot.
If none exist, return nil.
=end
def muni_routes(routes, destination)
  # we already have the hash
  # iterate through the hash
  # find the key with the value that matches the destination

  routes.each do |route, dest|
    return route if dest == destination
  end
  nil
end

puts "---------Muni Routes----------"
puts muni_routes({3 => "Arizmendi", 27 => "Nopalito", 55 => "Brenda's Soul Food"}, "Brenda's Soul Food") == 55
puts muni_routes({7 => "Devil's Teeth", 33 => "Devil's Teeth"}, "Devil's Teeth") == 7
puts muni_routes({90 => "Padrecito", 43 => "Hard Knox", 67 => "Martha's"}, "Hard Knox") == 43
puts muni_routes({10 => "Good Luck Dim Sum", 25 => "Art's Cafe"}, "Japanese Tea Hut") == nil

# ----------------- Switch Roles!
=begin
Largest Factor
Write a method, #largest_factor, that accepts an integer as
an argument and returnsthe largest factor of that integer.
When you are done take a look at the solutions tab!
=end

def largest_factor(n)
  l_factor = 1
  # (2..n/2).each do |num|
  #   if n % num == 0
  #     l_factor = num
  #   end
  # end

  (n/2).downto(2) do |num|
    return num if n % num == 0
  end

  1
end



puts "---------Largest Factor----------"
puts largest_factor(10) == 5
puts largest_factor(143) == 13
puts largest_factor(27) == 9
puts largest_factor(17) == 1
