# word-guessing-game.rb
# Pseudocode was distributed throughout the code to make it more readable.
# 
# Objective: make game in which one player enters a word, and the other player has to figure out wich word it is
# Class : Game

class Game

  attr_reader :word_array, :guesses_made, :number_slots_array, :word, :array_repeated
 
  # Creates instance variables - word (that will be guessed), number_slots_array (tool to check guess),
  # guesses_made (hash that defines which guesses were made, and if they were wrong or not), word_array(word divided into an array).
  # Output: none 
  def initialize(word)
    @word = word
    @number_slots_array = Array.new(word.length).fill("_")
    @guesses_made = Hash.new
    @word_array = @word.chars
    @array_repeated = Array.new
  end

    
  # Creates an array in which the chars that have the player's guess becomes "true", otherwise they become
  # false. After that, deleted all false chars, and counted the length of the array. If its length >1, it means
  # this letter, the player's guess, appears more than once in the word (thus, is_repeated_in_word? = true).
  # Output: boolean
  def is_repeated_in_word?(guess) 

    # To find out if guess is a letter that is in the word more than once:
    @array_repeated = @word_array.each_index.select { |i| @word_array[i] == guess }
    # Output: an array of the index numbers of when this letter is in the word
    
    # If the length of the array is >1, that means that the word has the letter that the player guessed more than once           
    if @array_repeated.length == 1
      false
    else 
      true
    end

  end

  # Updates the word according to the guesses_made hash, only inserting the ones that value as true.
  # Output: number_slots_array - String
  def update_word(guesses_made)

    @guesses_made.each do |guess, nature|

      if (nature == true) && (is_repeated_in_word?(guess) == true)
        @array_repeated.each { |index| number_slots_array[index] = guess} # will go through the array_repeated, and insert the guess in each part of number_slots_array that match
      elsif (nature == true) && (is_repeated_in_word?(guess) == false)
        i = word.index(guess)
        number_slots_array[i] = guess
      end

    end
    
    number_slots_array.join (" ")

  end

  # Checks if letter guessed is inside the word (if yes, = true; if no, = false). 
  # Add guess to the hash as the key, and the nature of it (true/false) as the value
  # Output(uses update_word to Output): number_slots_array.join(" ") - String that dislays to the user
  def check_guess(guess)
    indx = word.index(guess)

    if indx == nil
      puts nil # extra space
      puts "This letter is not in it!"
      puts nil # extra space
      guesses_made[guess] = false
    else 
      puts nil # extra space
      puts "You're right!"
      puts nil # extra space
      guesses_made[guess] = true
    end
        
    guesses_made
    update_word(guesses_made)

  end

  # Takes the length of the word and adds two, to define how many tries does the player have
  # (number of guesses available is related to the length of the word)
  # Output: number_guesses -> <integer>
  def number_guesses
    @word.length + 2
  end

end


# DRIVER CODE

# Player 1

puts "Welcome to the game player 1, insert your word"

player1_word = gets.chomp
player1_word.downcase!

game = Game.new(player1_word)

puts "Ok, please hand the game to player 2."

# Player 2

puts "Welcome player 2,the word you are going to guess looks like this: #{game.number_slots_array.join (" ")} "

guesses_counter = 0

while guesses_counter  < game.number_guesses 
  puts "You have exactly #{game.number_guesses - guesses_counter} guess(es) left"
  puts nil  
  puts "Please, make a guess (only one letter per guess)"
  guess = gets.chomp

  # If guess was already made (thus, this key is already in the "guesses_made" hash), p2 doesn't lose a round and tries again
  if game.guesses_made.key?(guess) == true 
    puts "You have already guessed that!"
  else 
    puts game.check_guess(guess)
    guesses_counter  += 1
  end

  puts nil

  # Check if the number_slots_array still have "_" - if not, game is over; otherwise, go again
  break if (game.number_slots_array.include? "_") == false

end

puts nil 

# Final Remarks
if (game.number_slots_array.include? "_") == true # Check again to make final remarks
    puts "You lost! The word was #{game.word}"
else
    puts "You won! Congratulations"
end

puts "Thanks for playing!"

