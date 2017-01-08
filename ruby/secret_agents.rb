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

secret_password = "bcd"

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
	puts secret_password
end

encrypt (secret_password)

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
	puts secret_password
end


decrypt (secret_password)

#decrypt(encrypt(secret_password)) - Ruby does not have nested method calls. Only encrypt will function in this case