module Hangman
 	class Game
    attr_reader :filename

		def initialize(input = {})
      @words = input.fetch(:words, [])
      @filename = input.fetch(:filename, nil)
      load_file(@filename) unless @filename.nil?
		end	

    def load_file(filename)
      File.readlines(filename).each do |line|
        if line.length >= 5 && line.length <= 12
          @words << line
        end
      end
    end

    def new_word
      Word.new(@words.shuffle!.pop)
    end

    def get_letter(input = gets.chomp)
      input
    end

    def solicit_letter
      "Please new letter: "
    end

    def word_info(word)
      info = "----- Information -----\n"
      info = info + "word : #{word.formatted_word}\n" 
      info = info + "You have #{word.remain_guesses.to_s} guesses\n"
      info = info + "correct letters: [#{word.correct_letters.sort.join(', ')}]\n"
      info = info + "missed letters: [#{word.missed_letters.sort.join(', ')}]\n"
      info = info + "-----------------------\n"
    end

    def play 
      word = new_word
      if play_with_a(word) == :success
        puts "You got the word"
      else
        puts "You idiot. The word is #{word.word}"
      end
    end

    private
    def play_with_a(word)
      until word.remain_guesses == 0
        puts word_info(word)
        puts solicit_letter
        letter = get_letter
        result = word.try(letter) 
        until result != :already_try
          puts "'#{letter}' is already tried."
          puts solicit_letter
          letter = get_letter
          result = word.try(letter) 
        end

        puts result == :hit ? "Hit!" : "Missed!"
        if word.found_all? 
          return :success
        end
      end
      return :failed
    end
	end
end