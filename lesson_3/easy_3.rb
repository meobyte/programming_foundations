puts 'Ex 1. ----------'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones

puts 'Ex 2. ----------'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'
puts flintstones

puts 'Ex 3. ----------'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones += %w(Dino Hoppy)
puts flintstones

puts 'Ex 4. ----------'

advice = 'Few things in life are as important as house training your pet dinosaur.'
puts advice.slice!(0, advice.index('house'))
puts advice

advice = 'Few things in life are as important as house training your pet dinosaur.'
puts advice.slice(0, advice.index('house'))
puts advice

puts 'Ex 5. ----------'

statement = 'The Flintstones Rock!'
puts statement.count('t')

puts 'Ex 6. ----------'

title = 'Flintstone Family Members'
puts title.center(40)
