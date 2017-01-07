#Questions
puts "What's the hamster name?"
	name=gets.chomp
puts "How loud is your hamster? (From 1-10)"
	volume=gets.chomp
	volume.to_i
puts "Whats the fur colod of the hamster?"
	fur=gets.chomp
puts "Is he/she a good adoption candidate?"
	adoption=gets.chomp	
if adoption=="yes"
	adoption=true
else
	adoption=false
end 	


puts "Estimated age?"
	age = gets.chomp
	if age == ""
	  age = nil
	end
	age.to_i 
	
	
if(age != nil) 
  puts "This hamster is so old!"
end
	  
puts "#{age}."


#Final Results
puts "This is the hamsters info: Name #{name}"
puts "He's loud with a volume level of #{volume}"
puts "The fur color is #{fur}"
puts "Is he/she a good cadidate for adoption? #{adoption}"
puts "The hamster is #{age} years old"