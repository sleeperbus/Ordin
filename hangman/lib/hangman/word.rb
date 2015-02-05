module Hangman
	class Word
		attr_reader :founded

		def initialize(word)
			@word = word.downcase
			@founded = "_" * @word.size
		end

		def include? letter
			if @word.include? letter.downcase
				replace_founded(letter)
				true
			else
				false
			end
		end

		def all_founded?
			!(@founded.include? "_")
		end

		private
		def replace_founded(letter)
			@word.split("").each_with_index do |chr, index|
				@founded[index] = letter if chr == letter
			end
		end
	end
end