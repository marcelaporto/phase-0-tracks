
require_relative 'word-guessing-game'

describe Game do
  let(:game) { Game.new("wordd") }

  it "check if the guess is right and update the word" do
    expect(game.check_guess("w")).to eq "w _ _ _ _"
  end

  it "updates the word with the right guesses" do
    game.check_guess("w")
    expect(game.update_word({"w"=>true})).to eq "w _ _ _ _"
  end

  it "determine the number of guesses" do
    expect(game.number_guesses).to eq 7
  end

  it "determine if it the guess appears more than once in the word" do
    expect(game.is_repeated_in_word("d")).to eq true
  end

end