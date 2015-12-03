# Ex 1.
#The original numbers array is printed because because numbers.uniqu
# created a new array

# Ex 2.

# 2. ! is the "not" operator and ? is a ternary operator (if shorthand).
# 2.1. != is the "not" equal operator and used in a control structure to check
# for inequality.
# 2.2. ! in front of a boolean for the opposite
# 2.3 ! at the end of a method is part of the method name, usually indicates a
# dangerous or suprising method.
# 2.4  2.5 ? before or after a method is just part of the method name
# 2.6 !! before an object turns it into a boolean

# Ex 3.
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub("important", "urgent")

# Ex 4.
numbers = [1, 2, 3, 4, 5]
# 4. numbers.delete_at(1) deletes at the 1 index, [1, 3, 4, 5]
# numbers.delete(1) deletes the value 1 [2, 3, 4, 5]

# Ex 5.
puts "true" if (10..100) === 42

# Ex 6.
famous_words = "seven years ago..."
puts famous_words.prepend("Four score and ")

famous_words = "seven years ago..."
puts famous_words.insert(0, "Four score and ")


# Ex 7.

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p eval(how_deep) # 42

# Ex 8.

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten!

# Ex 9.

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")

# Ex 10,

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones.map!.with_index { |x, i| [x, i] }

p flintstones.to_h
