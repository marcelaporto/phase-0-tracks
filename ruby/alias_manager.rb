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

def swap_names(name)
	split_name = name.split(" ")
	split_name[0], split_name[1] = split_name[1], split_name[0]
	split_name.join(" ")
end
def swap_vowel(char)
	vowels = ["a", "e", "i", "o"]
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
	consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x'] #got it from the internet
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


def new_name(name)
#method that swap words
name = swap_names(name)

#split into chars
name = name.downcase!
name_array = name.chars

# Conditional to aplly different methods
name_array.map! do |char|
	if char == " "
		char = " "
	elsif char == "a" || char == "e" ||  char == "i" || char == "o" || char ==  "u" #tried to put it all in between () and wasn't succesful, why is that?
		char = swap_vowel(char)
	else
		char = swap_consonant(char)
	end
end

new_name = name_array.join("")
new_name = new_name.upcase!

end



#DRIVER CODE

puts "Hello! What is your full name? (Only first and last)"
name = gets.chomp

fake_name = new_name(name)

puts "Your fake name is #{fake_name}"

