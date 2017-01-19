#Define Santa Class

class Santa

#Initializing
def initialize(gender, ethnicity)
	@gender = gender
	@ethnicity = ethnicity
	@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
	@age = 0
	puts "Initializing #{@gender} #{@ethnicity} Santa instance.."
end

# Getter methods

def gender
	@gender
end

def ethnicity
	@ethnicity
end

def reindeer_ranking
	@reindeer_ranking
end

# Setter methods

def age=(new_age)
	@age = new_age
end

def reindeer_ranking=(new_array)
	@reindeer_ranking = new_array
end

def gender=(new_gender)
	@gender = new_gender
end

# instance methods

def speak
	puts "Ho, ho, ho! Haaaappy holidays from #{@gender} #{@ethnicity} Santa!"
end

def eat_milk_and_cookies(cookie_type)
	puts "That was a good #{cookie_type} cookie!"
end

def celebrate_birthday
	@age += 1
	puts "Happy birthday santa! You are now #{@age} years old."
end

def get_mad_at(reindeer)
	puts "I am mad at you #{@reindeer}! You know what you did."
	reindeer_ranking.delete(reindeer)
	reindeer_ranking << reindeer #not the most simple way though, I wonder why doing reindeer_rank(reindeer).index = -1 didn't work
	p reindeer_ranking
end



def about
	puts "Gender: #{@gender}"
	puts "Ethnicity: #{@ethnicity}"
	puts "Reindeer ranking: #{@reindeer_ranking}"
	puts "Age: #{@age}"
end

end



# DRIVER CODE

#initializing new array and defining arrays of gender and ethnicity
santas = Array.new
genders = ["female", "male", "agender"] #, "male", "female", "gender fluid", "female", "female", "N/A", "male", "gender fluid"] 
ethnicities = ["white", "asian", "latinx"] #, "black", "black", "latinx", "latinx", "white", "korean", "black", "asian", "white"] 
n = genders.length

# Create instances and insert into santa array. For user interface, print out everytime a new instance is created
puts "Iterating through names list to create santas ..."
n.times do |i|
  santas << Santa.new(genders[i], ethnicities[i])
end
puts "There are now #{n} santas in the array."

p santas

#Test out instances
santas.each do |santa|
santa.speak
santa.eat_milk_and_cookies("chocolate chip")
santa.celebrate_birthday
santa.get_mad_at("Rudolph")
santa.gender= "male"
santa.about
end
