#CALCULATOR


def calculator(integer1,operator_s,integer2)
	integer1.send(operator_s,integer2) #use of Object#send to convert string into operator
end


#DRIVER CODE

puts "Please define your first integer"
integer1 = gets.chomp
integer1 = integer1.to_i

puts "Please define your second integer"
integer2 = gets.chomp
integer2 = integer2.to_i

puts "Result: #{integer1} plus #{integer2} is #{calculator(integer1,"+",integer2)}"
puts "Result: #{integer1} minus #{integer2} is #{calculator(integer1,"-",integer2)}"
puts "Result: #{integer1} divided by #{integer2} is #{calculator(integer1,"/",integer2)}"
puts "Result: #{integer1} times #{integer2} is #{calculator(integer1,"*",integer2)}"
