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





#DRIVER CODE

puts "Hello! What is your name?"
name = gets.chomp

new_name = fake_name(name)

puts "Your fake name is #{new_name}"
