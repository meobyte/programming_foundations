puts 'Ex 1. ----------'

10.times { |i| puts (' ' * i) + 'The Flintstones Rock!'  }

puts 'Ex 2. ----------'

statement = 'The Flintstones Rock'
array_of_letters = statement.gsub(/\s/, '').chars
frequency_hash = array_of_letters.group_by { |i| i.chr}.map { |k, v| [k, v.size] }

puts frequency_hash.sort

puts 'Ex 3. ----------'

puts 'the value of 40 + 2 is ' + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}"

puts 'Ex 4. ----------'

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
puts 'skips every other one as the array changes before the next loop'

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
puts 'The last two numbers are gone from the array before can iterate over them '

puts 'Ex 5. ----------'

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(10)

puts 'Ex 6. ----------'

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

puts 'The first one changes the argument being passed in.'

puts 'Ex 7. ----------'

def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
puts 'The limit variable had the wrong scope.'

puts 'Ex 8. ----------'

def titleize(title)
  words = title.split
  words.each { |word| word.capitalize! }.join(' ')
end

p titleize('sTaR wars: THE force awakens')

puts 'Ex 9. ----------'

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female'}
}

munsters.each do |name, stats|
  case stats['age']
    when 0..17 then stats['age_group'] = 'kid'
    when 18..65 then stats['age_group'] = 'adult'
    else stats['age_group'] = 'senior'
  end
end
p munsters