=begin 
PSEUDOCODE
Ask the clients name, age, city, favorite color, kids (y/n), how far from a park" - Driver Code



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

p clients_info