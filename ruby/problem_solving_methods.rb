#RELEASE 0

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

#RELEASE 1

def fib(number)
arr_2 = [0,1]
i = 0

	while i < (number -2)
	new_number = arr_2[i] + arr_2[i+1] 
	arr_2 << new_number
	i += 1
	end

puts arr_2
end

fib(100)

#RELEASE 2

=begin

We chose the Bubble Sort algorithm and visualizations and various articles on the internet helped us to understand.
Step-by step articles, that would build up the algorithm as they explained it, were really helpful. 

=end
def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

=begin
PSEUDOCODE
- Provide and array of numbers
- Define a method that sorts numbers
	- In the method it will go through each number
	- Compares the number with its extreme index (for example, number of the index 2 with numbr of the index -2)
	- If that number is smaller, the swap positions
	- Loop ends when it has gone through half of the length of the array
=end

	

	
