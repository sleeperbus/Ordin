# lib/tic_tac_toe_2/player.rb 
module TicTacToe2 
	class Player
		attr_reader :name, :color
		def initialize(input)
			@name = input.fetch(:name)
			@color = input.fetch(:color)
		end
	end
end