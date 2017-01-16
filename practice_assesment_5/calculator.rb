#CALCULATOR


def calculator(integer1,operator_s,integer2)
	integer1.send(operator_s,integer2) #use of Object#send to convert string into operator
end

i = 0 #counter
hash_calculator = Hash.new #new hash

puts "Please enter the operation you want to do"
operation = gets.chomp


while operation != "Done"

#Prepare variables to apply method
array_of_variables = operation.split
integer1 = array_of_variables[0].to_i
operator_s = array_of_variables[1]
integer2 = array_of_variables[2].to_i

result = calculator(integer1,operator_s,integer2)
hash_calculator["#{operation}"] = result #Insert operation and result in hash 

puts "The result is #{result}"

puts "Any other operations? Type it in or write down 'Done'"
operation = gets.chomp

i += 1

end

#Print out results
puts "#{i} calculations performed"
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