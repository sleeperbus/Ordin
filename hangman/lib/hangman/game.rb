module Hangman
	class Game
		attr_reader :founded_letters, :wrong_letters, :words
		attr_reader :remain_guesses
		def initialize(words) 
			@words = words
			raise if @words.size == 0
		end

		def new_word
			@founded_letters = []
			@wrong_letters = []
			@remain_guesses = 12	
			Word.new(@words.shuffle!.pop)
		end

		def summarize
			%Q(
-------------------------------------------------
remain_guesses : #{@remain_guesses.to_s}
Correct letters : #{@founded_letters.join(', ')}
Wrong letters : #{wrong_letters.join(', ')}
-------------------------------------------------
Please new letter:
			)
		end	

		def get_letter(letter = gets.chomp)
			letter
		end

		def already_input?(letter)
			(@founded_letters.include?(letter) || 
				@wrong_letters.include?(letter)) ? true : false
		end

		def play 
			word = new_word
			until @remain_guesses == 0
				if word.all_founded? 
					return
				end
				puts "The word is #{word.founded}"
				puts summarize	
				letter = get_letter
				while already_input?(letter)
					puts "You already input the letter '#{letter}'"			
					puts "Please input another letter"
					letter = get_letter
				end

				if word.include? letter 
					puts "#{letter} is in the word"
					@founded_letters << letter
				else 
					puts "#{letter} is not in the word"
					@wrong_letters << letter
				end

				@remain_guesses -= 1
			end
		end
	end
end