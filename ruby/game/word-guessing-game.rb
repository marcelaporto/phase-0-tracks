# word-guessing-game.rb
# Pseudocode was distributed throughout the code to make it more readable.
# 
# Objective: make game in which one player enters a word, and the other player has to figure out wich word it is
# Class : Game

class Game

  attr_reader :word, :guesses_made

  # Creates instance variables - word (that will be guessed), puzzle_view (tool to check guess),
  # guesses_made (hash that defines which guesses were made, and if they were wrong or not), word_chars(word divided into an array).
  # Output: none 
  def initialize
    @word = word
    @puzzle_view = []
    @guesses_made = Hash.new
    @array_repeated = []
    @guess = ""
    @win = false
  end

  def play
    game_intro
    take_turn
    final_message
  end

  private

  def game_intro
    print "Welcome to the game player 1, insert your word\n"

    @word = gets.chomp
    @word.downcase!
    @puzzle_view = Array.new(@word.length).fill("_")
    @number_guesses = @word.length + 2 # (number of guesses available is related to the length of the word)

    print " \nOk, please hand the game to player 2.\n Welcome player 2. \n"
  end

  def take_turn
    until game_over?
    display_progress
    get_guess
    check_guess(@guess) if valid?
    update_word(@guess)
    display_progress
    end
  end


  def final_message
    print "\n#{@puzzle_view.join(" ")}\n"
    
    if win?
      print "\nYOU ARE THE BEST, THE WORD WAS #{word.upcase}\n"
    else 
      print "\nBlÉ YOU LOST, THE WORD WAS #{word.upcase}\n"
    end
  print "\nThanks for playing!"
  end

  def win?
    !@puzzle_view.include?('_')
  end

  def game_over?
      @guesses_made.length >= @number_guesses  || !@puzzle_view.include?('_')
  end

  def display_progress
    @puzzle_view.join (" ")
  end

  # Checks if letter guessed is inside the word (if yes, = true; if no, = false). 
  # Add guess to the hash as the key, and the nature of it (true/false) as the value
  # Output(uses update_word to Output): puzzle_view.join(" ") - String that dislays to the user
  def check_guess(guess)
    indx = word.index(guess)

    if indx == nil
      #puts nil # extra space
      print "\nThis letter is not in it!\n"
      @guesses_made[@guess] = false
    else 
      print "\nYou're right!\n"
      @guesses_made[@guess] = true
    end
  end

  def get_guess
    print @puzzle_view.join(" ")
    print "\n\nYou have exactly #{@number_guesses - guesses_made.length} guess(es) left" 
    print "\nPlease, make a guess (only one letter per guess)\n"
    @guess = gets.chomp
  end

  def valid?
    if @guesses_made.key?(@guess) 
    print "\nYou have already guessed that!\n"
    get_guess
    else 
    true
    end
  end


  # Updates the word according to the guesses_made hash, only inserting the ones that value as true.
  # Output: puzzle_view - String
  def update_word(guess)

    @word.split("").each.with_index do |letter, index|
      if letter == @guess 
        @puzzle_view[index] = guess
      end
    end
  end
end


# DRIVER CODE

game = Game.new
game.play


# ALTERNATIVE SOLUTION TO INSERT REPEATED LETTERS
#
#   # Creates an array in which the chars are the position that the guess appears in the word. If its length >1, it means
#   # this letter, the player's guess, appears more than once in the word (thus, is_repeated_in_word? = true).
#   # Output: boolean (& array of position to use afterwards)
#   def is_repeated_in_word?(guess) 

#     # To find out if guess is a letter that is in the word more than once:
#     @position_letter = @word_chars.each_index.select { |i| @word_chars[i] == guess }
#     # Output: an array of the index numbers of when this letter is in the word
    
#     # If the length of the array is >1, that means that the word has the letter that the player guessed more than once           
#     if @position_letter.length == 1
#       false
#     else 
#       true
#     end

#   end
