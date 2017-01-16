#CALCULATOR


def calculator(integer1,operator_s,integer2)
	operator_s.to_i
	result = integer1 operator_s integer2
	return result
end

calculator(4,"+", 5)