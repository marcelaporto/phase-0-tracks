
puts "How many interviews are we doing today?"
numbr = gets.chomp
counter = 1

while counter <= numbr.to_i

puts nil
puts "Welcome to our interview!"
puts "What is your name"
name = gets.chomp
puts "Nice to meet you #{name}!"

# Instead of changing the age and birth_y to integers over and over in the if/else statement, try changing the input as soon as you receive it from the user
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
	puts "The result of the #{counter}º interview is: Almost definitely a vampire." #Line 33: You start to return the results in a puts return statement, but puts is a tricky statement. puts is an interesting method, it takes an object as an argument, displays it to $STDOUT (your terminal), and returns nil. The thing to remember with puts is that it returns nil after it is called, so when we write code like 
	else
		until new_alergie == "done"
			alergies << new_alergie #operation to insert element into array
			break if new_alergie == "nothing"
			puts "Any other alergies? (new alergie/done)" 
			new_alergie = gets.chomp
		end

#Summary of the data collected
puts "So what we now about #{name}"
puts "Age: #{age}"
puts "Birth Year: #{birth_y}"
puts "Garlic Lover? #{garlic}"
puts "Health Insurance: #{health}"
puts "Alergies: #{alergies.join(",")}" #built in method to convert array elements into strings, separated by commas


#Generate variable to check if birth year matches with the age given
birth_y_result = 2016 - birth_y.to_i # Instead of hardcoding the year, 2016, you can use the Ruby Date module (check it out in the Ruby docs) and use Date.now so your program could be used in any year.

# Refactor 
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

# 'Match the following conditions in the order they're listed.' We first read this when starting off the challenge and we may try to hack it out with a basic if/elsif structure but we quickly learn that the first condition to pass will be the result even if a 'more true' version is below. We may be tempted to switch the order for a working solution, but if we are to follow the constraints we need to be more creative. What if we made each individual scenario it's own respective if block? What would go inside each if block? Surely we can't just puts out the result otherwise our screen would be full of each vampire check that passed. What we could do is keep setting a variable result within each if block and then at the end of all the blocks display the result to look something like this
# if condition_1
#	result = 'low'
#end

#if condition_2
#	result = 'medium'
#end

#if condition_3
#	result = 'high'
#end

#puts result

puts "The result of the #{counter}º interview is: #{result}."

counter += 1

end
end
