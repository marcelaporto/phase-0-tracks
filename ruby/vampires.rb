
wolves_like_sunshine = true
wolves_like_garlic = true
vampires_like_sunshine = false
vampires_like_garlic = false

puts "Welcome to our interview!"
puts "What is your name"
name = gets.chomp
puts "Nice to meet you #{name}!"

puts "How old are you?"
age = gets.chomp

puts "What year were you born?"
birth_y = gets.chomp

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic = gets.chomp

puts "Would you like to enroll in the company’s health insurance? (y/n)"
health = gets.chomp

#Summary of the data collected
puts "So what we now about #{name}"
puts "Age: #{age}"
puts "Birth Year: #{birth_y}"
puts "Garlic Lover? #{garlic}"
puts "Health Insurence: #{health}"

#Generate age to check with the age given
birth_y_result = 2016 - birth_y

#Turn strings into booleans
if garlic=="y"
	garlic=true
else
		garlic=false
end 	


if health=="y"
	health=true
else
		health=false
end 	


#Analisys of vampire condition
if birth_y_result == age && (garlic || health)
	result = "Probably not a vampire"
elsif birth_y_result != age &&
		
