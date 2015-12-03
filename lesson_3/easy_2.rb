puts "Ex 1. ----------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.key?("Spot")

puts "Ex 2. ----------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.inject(:+)

puts "Ex 3. ----------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.delete_if {|name, age| age >= 100 }

puts "Ex 4. ----------"

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.capitalize
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase

puts "Ex 5. ----------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

puts "Ex 6. ----------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

puts "Ex 7. ----------"

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")

puts "Ex 8. ----------"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name.include?("Be") }
p flintstones.index { |name| name[0, 2] == "Be" }

puts "Ex 9. ----------"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0, 3] }

puts "Ex 10. ----------"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0, 3] }
