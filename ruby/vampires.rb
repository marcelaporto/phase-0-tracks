
puts "How many interviews are we doing today?"
numbr = gets.chomp
counter = 1

while counter <= numbr.to_i

puts nil # Adds extra space to the code
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

puts "Any alergies? (nothing/alergie)"
alergies = Array.new #define alergies as an array
new_alergie = gets.chomp

if new_alergie == "sunshine" # QUESTION: is there a way to put all options in the same if statement?
	puts "The result of the #{counter}º interview is: Almost definitely a vampire."
	else
		while new_alergie != "done"
			alergies << new_alergie #operation to insert element into array
			break if new_alergie == "nothing"
			puts "Any other alergies? (new alergie/done)" 
			new_alergie = gets.chomp
		end

#Summary of the data collected
puts nil
puts "So, what we now about #{name}"
puts "Age: #{age}"
puts "Birth Year: #{birth_y}"
puts "Garlic Lover? #{garlic}"
puts "Health Insurance: #{health}"
puts "Alergies: #{alergies.join(",")}" #built in method to convert array elements into strings, separated by commas


#Generate variable to check if birth year matches with the age given
birth_y_result = 2016 - birth_y.to_i

 
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
if (name == "Dra Cula" || name == "Tu Fang")
	result = "Definitely a vampire"
	elsif birth_y_result == age.to_i && (garlic || health) 
		result = "Probably not a vampire"
	elsif birth_y_result != age.to_i && !(garlic || health)
		result = "Probably a vampire"
	elsif birth_y_result != age.to_i && !garlic && !health
		result = "Almost certainly a vampire"	
	else
		result = "Results Inconclusive"
end	

puts nil
puts "The result of the #{counter}º interview is: #{result}."

counter += 1

end
end

puts nil
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
