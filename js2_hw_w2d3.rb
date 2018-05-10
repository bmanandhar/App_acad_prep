def pet_types(owners_hash)
  #
  # your code goes here
  #
  final, result, inverted = {}, {}, {}
  # converting keys into values and vice-versa
  owners_hash.each do |owner, pets|
    inverted[pets] = [owner]
  end
  # getting hash-data for each key(pets) & concatenating owners to single value
  inverted.each do |pets, owner|
    i = 0
    while i < pets.length
      if result.keys.include?(pets[i]) == false
        result[pets[i]] = owner
      else
        result[pets[i]] += owner
      end
    i += 1
    end
  end
  # sorting the values of final output
  i = 0
  while i < result.length
    final[result.keys[i]] = result.values[i].sort
  i += 1
  end

  final
end

def pet_types(owners_hash)
  pets_hash = Hash.new { |h,k| h[k] = [] }

  owners_hash.each do |owner, pets|
    pets.each do |pet_type|
      pets_hash[pet_type] << owner
    end
  end

  pets_hash.values.each(&:sort!)
  # pets_hash.values.each { |v| v.sort! }

  pets_hash
end

puts "-------Pet Types-------"

owners_1 = {
  "yi" => ["cat"]
}
output_1 = {
  "cat" => ["yi"]
}

owners_2 = {
  "yi" => ["cat", "dog"]
}
output_2 = {
  "cat" => ["yi"],
  "dog" => ["yi"]
}

owners_3 = {
  "yi" => ["dog", "cat"],
  "cai" => ["dog", "cat", "mouse"],
  "venus" => ["mouse", "pterodactyl", "chinchilla", "cat"]
}
output_3 = {
  "dog" => ["cai", "yi"],
  "cat" => ["cai", "venus", "yi"],
  "mouse" => ["cai", "venus"],
  "pterodactyl" => ["venus"],
  "chinchilla" => ["venus"]
}

puts pet_types(owners_1) == output_1
puts pet_types(owners_2) == output_2
puts pet_types(owners_3) == output_3
