require "spec_helper"
module Hangman
	describe Word do 
		context "#initialize" do 
			it "raises error without word when initialzing" do 
				expect { Word.new() }.to raise_error
			end

			it "does not raise error if there is parameter" do 
				expect { Word.new("activity") }.not_to raise_error
			end
		end

		context "#include?" do 
			it "returns true if a word has the letter" do 
				word = Word.new("activity")
				expect(word.include? "a").to be true
			end

			it "returns false if a word has not the letter" do 
				word = Word.new("activity")
				expect(word.include? "Z").to be false
			end
		end

		context "#founded" do 
			it "returns founded word" do 
				word = Word.new("activity") 
				word.include? "i"
				word.include? "t"
				expect(word.founded).to eq "__ti_it_"
			end
		end

		context "#all_founded?" do 
			it "returns true there is no more '_'" do 
				word = Word.new("activity")
				word.include? "a"
				word.include? "c"
				word.include? "t"
				word.include? "i"
				word.include? "v"
				word.include? "y"
				expect(word.all_founded?).to be true
			end
			it "returns false if there is at least one '_'" do 
				word = Word.new("activity")
				word.include? "y"
				expect(word.all_founded?).to be false
			end
		end
	end
end