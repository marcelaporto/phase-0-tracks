=begin 
PSEUDOCODE
Ask the clients name, age, city, favorite color, kids (y/n), how far from a park" - Driver Code

- Do the change thing
	- Hint: Strings have methods that will turn them into symbols, which would be quite handy here.)
- Do pseudocode


=end
clients_info = Hash.new

clients_info

#Driver Code

puts "Well, hello! What is your name?"
clients_info[:name] = gets.chomp

puts "And your age?"
clients_info[:age] = gets.chomp

puts "city"
clients_info[:city] = gets.chomp

puts "favorite color?"
clients_info[:color] = gets.chomp

puts "Have kids?"
kids = gets.chomp

if kids == "y"
	kids = "true"
elsif kids == "n"
	kids = "false"
else puts "Only y/n please!"
end

clients_info[:kids] = kids


puts "park distance"
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
	# if to identify which changes does he want to make

	puts "Please enter your new value"
	new_value = gets.chomp
	#clients_info[] =  new_value

	puts "Anything else you would like to change?"
	change = gets.chomp

end	

puts clients_info

puts "Well, thank you for your time!"