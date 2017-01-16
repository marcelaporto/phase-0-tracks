#CALCULATOR


def calculator(integer1,operator_s,integer2)
	result = integer1.send(operator_s,integer2) #use of Object#send to convert string into operator
	return result
end

calculator(4,"+", 5)