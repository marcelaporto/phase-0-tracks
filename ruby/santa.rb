#Define Santa Class

class Santa

# attr_reader and attr_accessor

attr_reader :ethnicity, :reindeer_ranking
attr_accessor :gender, :age, :reindeer_ranking

#Initializing

def initialize(gender, ethnicity)
	@gender = gender
	@ethnicity = ethnicity
	@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
	@age = 0
	puts "Initializing #{@gender} #{@ethnicity} Santa instance.."
end


#def reindeer_ranking
#	@reindeer_ranking
#end

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
	puts "I am mad at you #{reindeer}! You know what you did."
	
	bad_reindeer = reindeer_ranking.delete(reindeer)
	reindeer_ranking.insert(-1, bad_reindeer)

end


end

#method used to print all data together (outside of the class!)
def about
end

# DRIVER CODE

#initializing new array and defining arrays of gender and ethnicity
santas = Array.new
genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"] 
ethnicities = ["black", "latino", "white", "asian", "korean", "prefer not to say", "mystical creature (unicorn)", "N/A"]
i = 0 #counter

# Create instances and insert into santa array. For user interface, print out everytime a new instance is created
puts "Iterating through names list to create santas ..."

200.times do 
 	santas << Santa.new(genders.sample, ethnicities.sample) #generate new instance out of random gender and ethnicity
 	i += 1
end
puts "There are now #{i} santas in the array."

#Test out instances
santas.each do |santa|
puts nil
santa.speak
santa.eat_milk_and_cookies("chocolate chip")
santa.age= rand(0 ... 140)
santa.celebrate_birthday
santa.get_mad_at(santa.reindeer_ranking.sample)
santa.gender= (genders.sample)
# print out information about instance directly from outside the class:
puts "Gender: #{santa.gender}"
puts "Ethnicity: #{santa.ethnicity}"
puts "Reindeer ranking: #{santa.reindeer_ranking}"
puts "Age: #{santa.age}"
end

=begin
# Old getter and setter methods
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
=end
