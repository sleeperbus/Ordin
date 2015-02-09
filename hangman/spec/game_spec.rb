require "spec_helper"

module Hangman
	describe Game do 
		context "#new_word" do 
      it "returns nil if there is no more word" do 
        words = ["file", "edit", "selection", "find", "view"]
        game = Game.new(words: words)
        word = game.new_word
        word = game.new_word
        word = game.new_word
        word = game.new_word
        word = game.new_word
        expect { game.new_word }.to  raise_error
      end

      it "returns a random word" do 
        allow_any_instance_of(Array).to receive(:shuffle!) { ["file", "edit", "selection"] }
        words = ["edit", "selection", "file"]
        game = Game.new(words: words)
        expect(game.new_word.formatted_word).to eq "_________"
      end

      it "loads words from file" do 
        file = "/Users/sleeperbus/Dev/github/Ordin/hangman/example/5desk.txt"
        game = Game.new(filename: file) 
        word = game.new_word
        expect(word).not_to be_nil
      end


		end
	end
end
