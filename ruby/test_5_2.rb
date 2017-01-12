joan_application_interiord = {
	name:"Joanne",
	street:"600 Bush St",
	email:"joanne_at_bush@gmail.com",
	phone:"415-900-102",
	blue_shade:"indigo",
	wallpaper:["paisley", "Abstract woodsy scenes"],
	ombre:"fierce",
}

#DRIVER CODE

#Change name
puts = "Full name please!"
name = gets.chomp
joan_application_interiord[:name] = name

#Change blue shade
puts = "What is you second favorite shade of blue?"
blue = gets.chomp
joan_application_interiord[:blue_shade] = blue

#Change ombre
puts = "Are you sure? Ombre is from last year!"
ombre_2 = gets.chomp
joan_application_interiord[:ombre] = ombre_2

#Add value if hired
puts "You're hired!"
joan_application_interiord[:hired] = "hired"

