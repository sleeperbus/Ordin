module Hangman
	class Game
		attr_reader :founded_letters, :wrong_letters, :words
		attr_reader :remain_guesses
		def initialize(words) 
			@words = words
			raise if @words.size == 0
		end

		def new_word
			Word.new(@words.shuffle!.pop)
		end

		def summarize_word
			puts "remain_guesses : #{remain_guesses}"
			puts "Correct letters : #{founded_letters.join(', ')}"
			puts "Wrong letters : #{wrong_letters.join(', ')}"
		end
	end
end