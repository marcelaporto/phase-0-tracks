class Puppy

  def fetch(toy)
	puts "I brought back the #{toy}!"
	toy
  end


  def speak(number)
  	number.times do
  		puts "Woolf!"
  	end
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years (age)
  	dog_age = age*7
  	puts dog_age	
  end

  def high_five(dog_name)
  	dog_name.capitalize!
  	puts "#{dog_name}, high-five!"
  	puts "*high fives*"
  end

  def initialize
  	puts "Initializing new puppy instance.."
  end

end

class Fish

def initialize
  	puts "Initializing new fish instance.."
end

def  bubbles
	puts "*Blop blop blop*"
end

def swivels
	puts "*Swerve*"
end
	
end

fish_array = []

50.times do
	fish = Fish.new
	fish_array << fish
end

#DRIVE CODE for Fish Class

fish_array.each { |fish|
	fish.bubbles
	fish.swivels
}



=begin
#DRIVER CODE for Puppy Class

roxy = Puppy.new
roxy.fetch("plastic_bone")
roxy.speak(4)
roxy.roll_over
roxy.dog_years(5)
roxy.high_five("roxy")

=end