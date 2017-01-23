=begin
Pseudocode was distributed throughout the code to make it more readable.

Objective: make game in which one player enters a word, and the other player has to figure out wich word it is
Class : Game

Methods:
- initialize(word) 
  Creates instance variables - word (that will be guessed), number_slots_array (tool to check guess),
  guesses_made (hash that defines which guesses were made, and if they were wrong or not), $word (global scope variable used to check if guess was correct).
  Output: none 

- is_repeated_in_word(guess)	
  Creates an array in which the chars that have the player's guess becomes "true", otherwise they become
  false. After that, deleted all false chars, and counted the length of the array. If its length >1, it means
  this letter, the player's guess, appears more than once in the word (thus, is_repeated_in_word = true).
  Output: boolean
	  
- update_word(guesses_made)
  Updates the word according to the guesses_made hash, only inserting the ones that are true.
  Output: number_slots_array

- check_guess(guess)
  Checks if letter guessed is inside the word (if yes, = true; if no, = false). 
  Add guess to the hash as the key, and the nature of it (true/false) as the value
  Output(uses update_word to Output): number_slots_array.join(" ") - String that dislays to the user

- number_guesses (word)
  Takes the lenght of the word and adds two, to define how many tries does the player have
  Output: number_guesses -> <integer>

=end

#Create class of game
class Game

	attr_reader :word_array, :guesses_made, :number_slots_array, :word


	#Inside class of game, make method to enter the word
	#	- The word is then separated into an array of chars
	#	- We create a new array (number_slots_array), with the lenght of the word array, but it is only "_"
	def initialize(word)

		@word = word
		@number_slots_array = Array.new(word.length).fill("_")
		@guesses_made = Hash.new
		@word_array = @word.chars

	end

	def is_repeated_in_word(guess) 

		#To find out if guess is a letter that is in the word more than once:

		number_repeated_letters = word_array.map { |x| x == guess } # Output: when "guess" in the @word, char becomes "true"; else, it becomes "false"
		number_repeated_letters.delete_if {|char| char == false} #deletes chars that are false 
		
		#If the lenght of the array is >1, that means that the word has the letter that the player guessed more than once			
		if number_repeated_letters.length == 1
			false
		else 
			true
		end

	end


	#Method to insert char into game array
	def update_word(guesses_made)

		@guesses_made.each do |guess, nature|
			
			if (nature == true) && (is_repeated_in_word(guess) == true)
				array_repeated = @word_array.each_index.select { |i| @word_array[i] == guess }
				#Output: an array of the index numbers of when this letter is in the word

				array_repeated.each do |index| #this will go through the array_repeated, and insert the guess in each part of number_slots_array
					number_slots_array[index] = guess
				end

			elsif (nature == true) && (is_repeated_in_word(guess) == false)
				i = word.index(guess)
				number_slots_array[i] = guess	
			end
			
		end

		 number_slots_array.join (" ")

	end

	# Create a method to guess the word
	def check_guess(guess)

		i = word.index(guess)

		if i == nil
			puts nil #extra space
			puts "This letter is not in it!"
			puts nil #extra space
			guesses_made[guess] = false
		else 
			puts nil #extra space
			puts "You're right!"
			puts nil #extra space
			guesses_made[guess] = true
		end
		
		guesses_made
		update_word(guesses_made)
	
	end

	#condition to determine number of guesses (number of guesses available is related to the length of the word)
	def number_guesses
		@word.length + 2
	end


end


#DRIVER CODE

#Player 1

puts "Welcome to the game player 1, insert your word"

player1_word = gets.chomp
player1_word.downcase!

game = Game.new(player1_word)

puts "Ok, please hand the game to player 2."

#Player 2
puts "Welcome player 2,the word you are going to guess looks like this: #{game.number_slots_array.join (" ")} "

guesses_counter = 0

while guesses_counter  < game.number_guesses do
	puts "You have exactly #{game.number_guesses} guesses left"
	puts nil

	puts "Please, make a guess (only one letter per guess)"
	guess = gets.chomp

	#If guess was already made (thus, this key is already in the "guesses_made" hash), don't lose a round and try again
	if game.guesses_made.key?(guess) == true 
		puts "You have already guessed that!"
	
	else 
		puts game.check_guess(guess)
		guesses_counter  += 1

	end

	puts nil

	#Check if the number_slots_array still have "_" - if not, game is over; otherwise, go again
	break if (game.number_slots_array.include? "_") == false

end

puts nil 

if (game.number_slots_array.include? "_") == true #Check again to make final remarks
	puts "You have lost! The word was #{game.word}"
else
	puts "You have won! Congratulations"
end

puts "Thanks for playing!"

