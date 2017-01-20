module Shout

	def yell_angrily(words)
		words + "!!!" + " >:("
	end

	def yelling_happily(words)
		words + ", I am so happy!!!" + " :)"
	end

end


class Coach
	 include Shout
end

class TheHulk
	 include Shout
end

#DRIVER CODE

coach = Coach.new
puts coach.yell_angrily("Get your act together and play the game")
puts coach.yelling_happily("You know it, if we keep it up, we will win this")

hulk = TheHulk.new
puts hulk.yelling_happily("I like to jump on cars")
puts hulk.yell_angrily("You don't understan the Hulk")






=begin
CODE FOR RELEASE 1
module Shout

	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yelling_happily(words)
		words + ", I am so happy!!!" + " :)"
	end

end

#DRIVER CODE

puts Shout.yell_angrily("I can't believe they got married")
puts Shout.yelling_happily("I can't believe they got married")
=end
