# lib/tic_tac_toe_2/game.rb
module TicTacToe2
	class Game
		attr_reader :players, :board, :current_player, :other_player

		def initialize(players, board = Board.new)	
			@players = players
			@board = board
			@current_player, @other_player = players.shuffle
		end

		def switch_player 
			@current_player, @other_player = @other_player, @current_player
		end

		def solicit_move
			"#{current_player.name}, your turn, 1 ~ #{board.grid.length * board.grid.length}: "
		end

		def get_move(user_input = gets.chomp)
			position = [
				(user_input - 1) % board.grid.length,
				(user_input - 1) / board.grid.length 
			]
		end

		def play
		end
	end
end