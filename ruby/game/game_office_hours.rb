# Solo Challenge 6
# Done with Andrew (Instructor) in office hours
# Not complete, but good Top-Down reference

class Hangman
  def initialize(secret_word)
    @secret_word = secret_word
    @puzzle = Array.new(@secret_word.length).fill("_")
    @total_attmpts = @secret_word.length + 2
    @attempts_taken = 0
  end

  def play
    introduction
    until game_over?
      take_turn
    end
    display_result
  end

  def take_turn
    display_current_progress
    guess = get_users_guess
    replace(guess) if got_it_right?(guess)
    @attempts_taken += 1
  end

  def display_result
    if !@puzzle.include?('_')
      puts "CONGRATULATIONS THE WORD WAS #{@secret_word}"
    else
      puts "WAH WAH YOU LOSE"
    end
  end

  def game_over?
    @attempts_taken >= @total_attmpts || !@puzzle.include?('_')
  end

  def display_current_progress
    puts @puzzle.join(' ')
  end

  def got_it_right?(guess)
    @secret_word.include?(guess)
  end

  def replace(guess)
    @secret_word.split('').each.with_index do |letter, index|
      if letter == guess
        @puzzle[index] = guess
      end
    end
  end

  def get_users_guess
    puts "give me a guess"
    gets.chomp
  end

  def introduction
    puts "Welcome to hangman blah blahb labh..."
  end
end

# DRIVER CODE

my_game = Hangman.new('cheese')
my_game.play