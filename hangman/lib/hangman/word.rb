module Hangman
	class Word
		attr_reader :remain_guesses, :length, :correct_letters, :missed_letters, :word
		
		def initialize(word)
			@word = word.downcase.gsub(/\s+/, "")
			@remain_guesses = @word.length
			@length = word.length
			@correct_letters = []
			@missed_letters = []  
		end
		
		def try(letter)
			if @correct_letters.include?(letter) || @missed_letters.include?(letter)
				:already_try	
			else 
				if @word.split("").include?(letter)
					@correct_letters << letter
					:hit
				else
					@missed_letters << letter
					@remain_guesses -= 1
					:missed
				end
			end
		end
		
		def formatted_word
			@word.split("").map { |letter|
				@correct_letters.include?(letter) ? letter : "_"
			}.join("")
		end
		
		def found_all?
			!(formatted_word.include?("_"))
		end 
	end
end