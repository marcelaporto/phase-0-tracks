
wolves_like_sunshine = true
wolves_like_garlic = true
vampires_like_sunshine = false
vampires_like_garlic = false

=begin
puts "Welcome to our interview!"
puts "What is your name"
name = gets.chomp
puts "Nice to meet you #{name}!"
=end

puts "How old are you?"
age = gets.chomp

puts "What year were you born?"
birth_y = gets.chomp

=begin
puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic = gets.chomp

puts "Would you like to enroll in the company’s health insurance? (y/n)"
health = gets.chomp

#Summary of the data collected
puts "So what we now about #{name}"
puts "Age: #{age}"
puts "Birth Year: #{birth_y}"
puts "Garlic Lover? #{garlic}"
puts "Health Insurance: #{health}"
=end

#Generate variable to check if birth year matches with the age given
birth_y_result = 2016 - birth_y.to_i
birth_y_result
age
p birth_y_result
p age
puts birth_y_result == age.to_i

=begin

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
if birth_y_result == age && (garlic || health) #not getting it
	result = "Probably not a vampire"
	elsif birth_y_result != age && (garlic || health)
		result = "Probably a vampire"
	elsif birth_y_result != age && !garlic && !health
		result = "Almost certainly a vampire"	
	elsif name == "Dra Cula" || name == "Tu Fang"
		result = "Definitely a vampire."
	else
		result = "Results Inconclusive"
end	

gh = birth_y_result == age 
puts "The result is #{gh}"
puts "Your result after the interview is: #{result}"
=end
