puts "Ex 1. ----------"

if false
  greeting = "hello world"
end

greeting #nil

puts "gretting is nil outside of the if statement."

puts "Ex 2. ----------"

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings #  "{ a" 'hi there'}

puts "Ex 2. A ----------"

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" # two
puts "three is: #{three}" # three

puts "Ex 2. B ----------"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" # two`
puts "three is: #{three}" # three

puts "Ex 2. C ----------"

def mess_with_vars(one, two, three)
  one.gsub!("one","two") # gsub! modifies the caller
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # two
puts "two is: #{two}" # three
puts "three is: #{three}" # one

puts "Ex 4. ----------"

require 'securerandom'
def make_uuid
    SecureRandom.uuid
end

puts make_uuid

def make_uuid2
  hex_set = Array('0'..'9') + Array('a'..'f')
  id = Array.new(32) { hex_set.sample }.join
  "#{id[0, 8]}-#{id[8, 4]}-#{id[12, 4]}-#{id[16, 4]}-#{id[20, 12]}"
end

puts make_uuid2

def generate_UUID
    characters = []
    (0..9).each { |digit| characters << digit.to_s }
    ('a'..'f').each { |digit| characters << digit }

    uuid = ""
    sections = [8, 4, 4, 4, 12]
    sections.each_with_index do |section, index|
      section.times { uuid += characters.sample }
      uuid += '-' unless index >= sections.size - 1
    end

    uuid
end

puts generate_UUID

puts "Ex 5. ----------"
def is_a_number? string
  true if Integer(string) rescue false
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  return true
end

puts dot_separated_ip_address?("127.0.0.1")
puts dot_separated_ip_address?("nope")
