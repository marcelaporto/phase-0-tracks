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

=end

#Methods to create a fake name

def swap_names(name)
	split_name = name.split(" ")
	split_name[0], split_name[1] = split_name[1], split_name[0]
	split_name.join(" ")
end

def swap_letter(char)
	letters = ['a', 'e', 'i', 'o', 'u','b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'] 
	
	if char == 'z'
		char = 'b'
	elsif char == 'u'
		char = 'a' 
	else 		
		i = letters.index(char)
		char = letters[i + 1]
	end
end

def name_capitalize(name_array)

	new_name = name_array.join("")
	new_name = new_name.split

	new_name[0].capitalize!
	new_name[1].capitalize!

	new_name = new_name.join(" ") 

end

#Method that uses all of the methods above

def new_name(name)

	#1. Method that swap words
	name = swap_names(name)

	#2. Split into chars
	name = name.downcase!
	name_array = name.chars

	#3. Conditional to aplly different methods, depending on the type of char
	name_array.map! do |char|

		if char == " "
			char = " "
		else
			char = swap_letter(char)
		end
	end

	#4. Capitalize first two letters of the names
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
