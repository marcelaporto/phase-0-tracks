

university = {
	department_health: {
		nursery: "easy",
		biology: "medium",
		medicine: "hard"
	},
	department_social_studies:{
		philosophy: "easy",
		history: "medium",
		economics: "hard"

	},
	department_math: {
		engineering: "easy",
		conceptual_math: "medium",
		physics: "hard"
	},
	teachers_type: ["Academic", "Part time workers in the market", "Helps around with extracurricular activities"],
	students: {
	  types_students: {
	    lazy: 0.55,
	    focused:0.25, 
	    sports_driven: 0.20
	  },
	  students_housing: ["Dorms", "Frat Houses", "Sorority houses", "Shared apartment"],
	},
	major_sport: "Fantasy Futball",
	known_for: "Best history major in the US",
	miles2urban_city: 220,
	tech_school: false
}


puts university
puts nil


#Print out nested items
puts university [:major_sport]
p university[:teachers_type]
puts university[:students][:types_students] 
puts university[:students][:students_housing][0] 
puts university[:department_social_studies][:philosophy] 

# Add one item

puts nil
puts university
puts nil

university[:teachers_type].push("Old non-tech lady/sir") #Add to array
university[:students][:types_students][:glee_driven] = 0.002 #Add to hash
university[:department_math][:metaphysics] = "superhard"


# Overwrite one item

puts university
puts nil

university[:major_sport] = "Wii Sports"
university[:students][:students_housing][3] = "Hippie Cabins"


# Use three other built in methods 

puts university
puts nil

university[:department_math][:metaphysics].upcase!
university[:students][:students_housing].reverse!

puts a = university[:students][:types_students].length
puts nil

puts university
puts nil

