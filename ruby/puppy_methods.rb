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

end

#DRIVER CODE

roxy = Puppy.new
roxy.fetch("plastic_bone")
roxy.speak(4)
roxy.roll_over
roxy.dog_years(5)
roxy.high_five("roxy")
