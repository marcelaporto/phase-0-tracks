joan_application_interiord = {
	name:"Joanne",
	address:"600 Bush St",
	email:"joanne_at_bush@gmail.com",
	phone:"415-900-102",
	blue_shade:"indigo",
	wallpaper:["paisley", "Abstract woodsy scenes"],
	ombre:"fierce"
}

p joan_application_interiord

#DRIVER CODE

#Change name
puts "Full name please!"
name = gets.chomp
joan_application_interiord[:name] = name

#Change blue shade
puts "What is you second favorite shade of blue?"
blue = gets.chomp
joan_application_interiord[:blue_shade] = blue

#Change ombre
puts "Are you sure? Ombre is from last year!"
ombre_2 = gets.chomp
joan_application_interiord[:ombre] = ombre_2

#Add value if hired
puts "You're hired!"
joan_application_interiord[:hired] = "hired"

p joan_application_interiord


#What happens if store a key in a variable, then access the hash using the variable?
hey = :name  
puts joan_application_interiord[hey] # it works!

#What happens when try an expression like your_hash[:name] + your_hash[:address] (or whatever keys you used)? Does it affect the original hash?

puts (joan_application_interiord[:name] + joan_application_interiord[:address])
#=> Joanne600 Bush St

p joan_application_interiord #does not change the hash