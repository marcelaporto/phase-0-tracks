#CALCULATOR


def calculator(integer1,operator_s,integer2)
	if operator_s != ("+" || "-" || "/" || "*" || "^" || "%")  #recognizes if the user inputs different symbols than the expected operators
		return "cannot compute"
	else
		return integer1.send(operator_s,integer2) #use of Object#send to convert string into operator
	end
end

hash_calculator = Hash.new #new hash

puts "Please enter the operation you want to do"
operation = gets.chomp


while operation != "Done"

#Prepare variables to apply method
array_of_variables = operation.split

begin #simple conditional function, to recognize if operation had only integeres or not, and gives the user another try, until he gets it right
integer1 = Integer(array_of_variables[0]) #using Kernel#Integer, symbols and other random stuff aren't recognized, differently than #to_i
integer2 = Integer(array_of_variables[2])	
rescue
	puts "Enter another operation please, with real numbers!"
	operation = gets.chomp
	array_of_variables = operation.split
	retry
#	integer2 = Integer(array_of_variables[2])
#	integer1 = Integer(array_of_variables[0]) 
end

operator_s = array_of_variables[1]


result = calculator(integer1,operator_s,integer2)

hash_calculator["#{operation}"] = result #Insert operation and result in hash 

puts "The result is #{result}"

puts "Any other operations? Type it in or write down 'Done'"
operation = gets.chomp

end

#Print out results
puts "#{hash_calculator.length} calculations performed"
hash_calculator.each {|calculation, result| puts " #{calculation} = #{result}"}



=begin
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
=end