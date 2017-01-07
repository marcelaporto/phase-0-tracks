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
	i = 0
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	while  i < secret_password.length
		if secret_password[i] == " "
			secret_password[i] = " "
		elsif secret_password[i] == "a"
				secret_password[i] = "z"
		else 
			 new_variable = secret_password[i] #string 
			 number = alphabet.index(new_variable) - 1 #bring it back to index
			 secret_password[i] = alphabet[number]
		end
		i += 1
	end
	puts secret_password
end


decrypt (secret_password)