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
				(user_input.to_i - 1) % board.grid.length,
				(user_input.to_i - 1) / board.grid.length 
			]
		end

		def play
			puts "First player is #{current_player.name}."
			while true 
				board.draw_grid
				puts solicit_move
				x, y = get_move
				until board.is_empty?(x, y)
					puts "#{current_player.name}, it's not empty."
					x, y = get_move
				end
				board.set_cell(x, y, current_player.color)
				if board.game_over
					puts  board.game_over == :winner ? 
					 "#{current_player.name} wins!" :
					 "Draw!"
					board.draw_grid
					 return
				else
					switch_player
				end
			end

			# while !board.game_over
			# 	board.draw_grid
			# 	puts solicit_move 
			# 	x, y = get_move
			# 	until board.is_empty?(x, y)
			# 		puts "The number you select is already taken."
			# 		puts solicit_move
			# 		x, y = get_move
			# 	end
			# 	board.set_cell(x, y, current_player.color)
			# 	switch_player
			# end
			# board.draw_grid
			# puts board.winner? ? "#{current_player.name} wins!" : "Draw!"
		end
	end
end