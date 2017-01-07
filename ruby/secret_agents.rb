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

secret_password = "aaa bbbb"

def encrypt(secret_password)
	index = 0
	while  index < secret_password.length
		if secret_password[index] == " "
			secret_password[index] = " "
		else
			secret_password[index] = secret_password[index].next!
		end
		index += 1
	end
	puts secret_password
end

encrypt (secret_password)

alphabet = "abcdefghijklmnopqrstuvwxyz"

def decrypt(secret_password)
	i = 0
	while  i < secret_password.length
		if secret_password[i] == " "
			secret_password[i] = " "
		else
			new_variable = secret_password.index(i)
			secret_password[i] = alphabet[new_variable.to_i - 1] 
		end
		index += 1
	end
	puts secret_password
end
