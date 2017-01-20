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