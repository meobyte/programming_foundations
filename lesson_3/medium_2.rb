puts 'Ex 1. ----------'

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' }
}
sum_age = 0
munsters.each do |name, stats|
  sum_age += stats['age'] if stats['gender'] == 'male'
end

puts sum_age

puts 'Ex 2. ----------'

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

munsters.each do |name, stats|
  puts "#{name} is a #{stats['age']} year old #{stats['gender']}."
end

puts 'Ex 3. ----------'

def tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param += ['rutabaga']
  return a_string_param, an_array_param #explicitly return both
end

my_string = 'pumpkins'
my_array = ['pumpkins']
my_string, my_array = tricky_method(my_string, my_array)

puts 'My string looks like this now: #{my_string}'
puts 'My array looks like this now: #{my_array}'

# I would also consider making two separate methods depending on the requirements

puts 'Ex 4. ----------'

puts sentence = 'Humpty Dumpty sat on a wall.'

puts sentence.split(/\W/).reverse.join(' ') + '.'

puts 'Ex 5. ----------'

puts '34. The method only changes the local variable inside it.'

puts 'Ex 6. ----------'

puts 'Yes, the original hash is changed because the method operates on the object tha was passed in.'

puts 'Ex 7. ----------'

def rps(fist1, fist2)
  if fist1 == 'rock'
    (fist2 == 'paper') ? 'paper' : 'rock'
  elsif fist1 == 'paper'
    (fist2 == 'scissors') ? 'scissors' : 'paper'
  else
    (fist2 == 'rock') ? 'rock' : 'scissors'
  end
end

puts 'paper'

puts 'Ex 8. ----------'

def foo(param = 'no')
  'yes'
end

def bar(param = 'no')
  param == 'no' ? 'yes' : 'no'
end

puts "#{bar(foo)}. foo always returns yes and no doesn't equal yes, so no is returned."
