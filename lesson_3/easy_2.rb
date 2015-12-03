puts 'Ex 1. ----------'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }

puts ages.key?('Spot')

puts 'Ex 2. ----------'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }

puts ages.values.inject(:+)

puts 'Ex 3. ----------'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

puts ages.delete_if { |_, age| age >= 100 }

puts 'Ex 4. ----------'

munsters_description = 'The Munsters are creepy in a good way.'

puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

puts 'Ex 5. ----------'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10 }

additional_ages = { 'Marilyn' => 22, 'Spot' => 237 }

puts ages.merge!(additional_ages)

puts 'Ex 6. ----------'

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }

puts ages.values.min

puts 'Ex 7. ----------'

advice = 'Few things in life are as important as house training your pet dinosaur.'

puts advice.include?('Dino')

puts 'Ex 8. ----------'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |name| name.include?('Be') }
puts flintstones.index { |name| name[0, 2] == 'Be' }

puts 'Ex 9. ----------'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.map! { |name| name[0, 3] }

puts 'Ex 10. ----------'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.map! { |name| name[0, 3] }
