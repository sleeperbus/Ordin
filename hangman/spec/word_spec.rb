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
		
		context "#try" do 
			it "returns :ok when user's letter is exist" do
				word = Word.new("iphone")
				expect(word.try("i")).to eq :ok
			end
			
			it "returns :already_try when user's letter is duplicated" do
				word = Word.new("iphone")
				word.try("i")
				expect(word.try("i")).to eq :already_try
			end
			
			it "returns :missed when user's letter is not exist" do
				word = Word.new("iphone")
				word.try("i")
				word.try("p")
				expect(word.try("x")).to eq :missed
			end
		end
		
		context "#formatted_word" do
			it "returns just hyphen when there is no match" do 
				word = Word.new("iphone")
				word.try("x")
				word.try("t")
				expect(word.formatted_word).to eq "______"
			end
			
			it "returns word with hyphen" do 
				word = Word.new("iphonei")
				word.try("i")
				word.try("e")
				expect(word.formatted_word).to eq "i____ei"
			end
		end
		
		context "#found_all" do
			it "returns true if there is no hyphen"	do 
				word = Word.new("iphone")
				word.try("i")
				word.try("p")
				word.try("h")
				word.try("o")
				word.try("n")
				word.try("e")
				expect(word.found_all?).to be true
			end
			
			it "returns false if there is at least one hyphen"	do 
				word = Word.new("iphone")
				word.try("i")
				word.try("h")
				word.try("o")
				word.try("n")
				word.try("e")
				expect(word.found_all?).to be false
			end
		end

	end
end