#Release 0

arr = [1,2,3,4,5,6,7]

def search_array(arr, number)
i = 0

while i < arr.length	
	if arr[i] == number
		return i 
	end
	i += 1
	end
end

search_array(arr,1)

# 