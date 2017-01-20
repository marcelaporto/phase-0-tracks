=begin
PSEUDOCODE

- Get the name from the user - Driver code
- Apply method of changing names
	- First, it is going to split into two words
		- Swap the first and the last name
		- Use bubble sorting algorithm as inspiration
	- Then, split into char it will go through each letter
		- If char is " ", keep it that way
		- If it is a vowel (use || operator?), change to next vowel (define a variable of vowels?)
		- If it is a consonant, change to next consonant
	- Join it back to a string (define as a new variable and make sure it is a string with .class)
- Give it back to the user


CHANGES

1. 
In your swap_vowel and swap_consonant methods, can you think of a more efficient way to find the next letter 
that does not involve iterating over the entire collection of vowels or consonants in order to find the letter 
that you passed into the method? Hint...there is a method called .index() that you can use to find the position 
of an element in an array or string. 

2. 
The bodies of your swap_vowel and swap_consonant methods are almost exactly the same with the exception of which 
collection of letters you are using and the edge cases. Can you think of a way to make a more general method that 
could handle either consonants or vowels, preventing you from having to repeat yourself at all? Hint...you can pass 
the appropriate collection of letters into the method so that the appropriate array of letters is available to you.

=end

#Methods to create a fake name

def swap_names(name)
	split_name = name.split(" ")
	split_name[0], split_name[1] = split_name[1], split_name[0]
	split_name.join(" ")
end

def swap_vowel(char)
	vowels = ["a", "e", "i", "o", "u"]
	i = 0
	
	if char == "u"
		char = "a"
	else vowels.each do |vowel|
		if char == vowel
			char = vowels[i + 1]
			return char
		else
			i += 1
		end
	end
end
end


def swap_consonant(char)
	consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'] #got it from the internet
	i = 0
	
	if char == "z"
		char = "b"
	else consonants.each do |consonant|
		if char == consonant
			char = consonants[i + 1]
			return char
		else
			i += 1
		end
	end
end
end


def name_capitalize(name_array)

	new_name = name_array.join("")
	new_name = new_name.split

	new_name[0].capitalize!
	new_name[1].capitalize!

	new_name = new_name.join(" ") 

end

#Method that uses all fo the methods above

def new_name(name)

#method that swap words
name = swap_names(name)

#split into chars
name = name.downcase!
name_array = name.chars

# Conditional to aplly different methods, depending on the type of char
name_array.map! do |char|
	if char == " "
		char = " "
	elsif char == "a" || char == "e" ||  char == "i" || char == "o" || char ==  "u" #tried to put it all in between () and wasn't succesful, why is that?
		char = swap_vowel(char)
	else
		char = swap_consonant(char)
	end
end

#Capitalize first two letters of the names
name_capitalize(name_array)

end


#DRIVER CODE

puts "Hello! What is your full name? (Only first and last)"
name = gets.chomp

#Arrays to store names
name_transformation = Hash.new


until name == "Exit"
	
	fake_name = new_name(name)

	name_transformation[name] = fake_name
	
	puts "Your fake name is #{fake_name}"

	puts "Any other fake name you would like to generate?(Name/Exit)"
	name = gets.chomp
end

#Prints results when the user doesn't want to generate new names

puts nil
puts "Results:"


name_transformation.each do |real_name, fake_name|
	puts "#{fake_name} is actually #{real_name}"
end
