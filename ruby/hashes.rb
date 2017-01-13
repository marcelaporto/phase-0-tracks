=begin 
PSEUDOCODE
Ask the clients name, age, neighborhood, favorite color, kids (y/n), how far from a park" - Driver Code
Convert certain variables to their original type, especially from strings to booleans
	- For strings to integers, use built in method ".to_i"
	- For booleans, use if condition that changes its value depending on the users reponse
Print out the hash
Ask if they would like to change any value
While the answer isn't "No", repeat the following procedure:
	- Ask which type of value they would like to change, and store that into a variable
	- Convert it to symbol
	- Ask whats is the new value for that type of content, and store that answer in a variable
	- Overwrite the content in the hash
Print out the new hash 
=end

clients_info = Hash.new

clients_info

#Driver Code

puts "Well, hello! What is your name?"
clients_info[:name] = gets.chomp

puts "And your age?"
clients_info[:age] = gets.chomp

puts "In which neighborhood do you live in"
clients_info[:neighborhood] = gets.chomp

puts "What is you favorite color?"
clients_info[:color] = gets.chomp


puts "Do you have any kids? (y/n)"
kids = gets.chomp

if kids == "y"
	kids = "true"
elsif kids == "n"
	kids = "false"
end

clients_info[:kids] = kids


puts "How far do you live from a park?"
park_distanc = gets.chomp
clients_info[:park_distanc] = park_distanc.to_i

puts clients_info

puts "Would you like to change anything?"
change = gets.chomp

if change == "No"
	puts "Well, thanks for answering the questions!"
else
	until change == "No"
	puts "What do you want to change?"
	type_change = gets.chomp
	type_change = type_change.to_sym
	# if to identify which changes does he want to make

	puts "Please enter your new value"
	new_value = gets.chomp
	clients_info[type_change] =  new_value

	puts "Anything else you would like to change?(Yes/No)"
	change = gets.chomp
	end
end	

puts clients_info

puts "Well, thank you for your time!"