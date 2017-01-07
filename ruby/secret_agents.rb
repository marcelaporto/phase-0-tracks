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

def encrypt("password")
	i = 0
	while i < password.lenght
		if password[i] == " "
			password = " "
		else
			password[i] = password[i].next!
		end
	i += 1
	end
	puts password
end
