=begin
Pseudocode
1) encrypt
- Loop through each letter (word lenght)
- When you get to the letter,
- If it is equal to space, leave it that way
	- Else, this letter becomes the next (use bang operator)
- Counter goes to next letter
- In the end, print 

2)decrypt
- Define "abcdefghijklmnopqrstuvwxyz" as string
- Loop through each letter (word lenght)
- When you get to the letter,
- If it is equal to space, leave it that way
	- Else, ask index of the letter, and equal as new variable
		- letter becomes new variable -1  of the alphabet string
- Counter goes to next letter
- In the end, print 

=end

#secret_password = "bcd"

def encrypt(secret_password)
	index = 0
	while  index < secret_password.length
		if secret_password[index] == " "
			secret_password[index] = " "
			elsif secret_password[index] == "z"
					secret_password[index] = "a"
			else
				secret_password[index] = secret_password[index].next!
		end
		index += 1
	end
end


def decrypt(secret_password)
	index = 0
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	while  index < secret_password.length
		if secret_password[index] == " "
			secret_password[index] = " "
			elsif secret_password[index] == "a"
					secret_password[index] = "z"
			else 
				 new_variable = secret_password[index] #string 
				 number = alphabet.index(new_variable) - 1 #bring it back to index
				 secret_password[index] = alphabet[number]
		end
		index += 1
	end
end

#decrypt(encrypt(secret_password)) - Ruby does not have nested method calls. Only encrypt will function in this case

# OUR DRIVER CODE

# asks the user whether they would like to decrypt or encrypt a password
puts "Hello secret agent. Would you like to decrypt or encrypt a password?"
preference = gets.chomp

# ask for the password
puts "Could you give us the password, please"
secret_password = gets.chomp

# run methods
if preference == "encrypt"
	encrypt(secret_password)
	elsif preference == "decrypt"
		decrypt(secret_password)
	else
		puts "I am sorry, this does not make sense. Could you type in again, please?"
end

# give the user the result
puts "The password in a/an #{preference} manner: #{secret_password}"

# say bye
puts "Thank you for using DBC services"