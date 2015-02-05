require "spec_helper"

module Hangman
	describe Game do 
		context "#initialize" do 
			it "raises error if there is not initial value" do 
				expect { Game.new() }.to raise_error
			end

			it "raises error if initial array size is 0" do
				expect { Game.new([]) }.to raise_error
			end

			it "does not raise error if there is initial words array" do 
				expect { Game.new(["whatever", "world", "plus"]) }.not_to raise_error
			end
		end

		context "#new_word" do 
			it "returns new word" do 
				allow_any_instance_of(Array).to receive(:shuffle!) { ["new", "world", "hello"] }			
				game = Game.new(["new", "world", "hello"])					
				expect(game.new_word.founded).to eq "_____"
			end

			it "decrease array size by -1 " do 
				game = Game.new(["new", "world", "hello"])					
				word = game.new_word
				expect(game.words.size).to eq 2
			end
		end
	end
end
