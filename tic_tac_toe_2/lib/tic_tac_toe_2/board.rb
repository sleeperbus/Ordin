# lib/tic_tac_toe_2/board.rb
module TicTacToe2
    class Board
        attr_reader :grid 
        
        def initialize(input = {})
            @grid = input.fetch(:grid, default_grid)
        end
        
        def get_cell(x, y)
            grid[y][x]
        end
        
        def set_cell(x, y, value)
            get_cell(x, y).value = value
        end

        def is_empty?(x, y)
            get_cell(x, y).value.empty?
        end

        def draw?
            !(grid.flatten.map { |cell| cell.value }.any_empty?)
        end

        def winner?
            winning_positions.each do |winning_position| 
                next if winning_positions_value(winning_position).all_empty?
                return true if winning_positions_value(winning_position).all_same?
            end
            false
        end

        def game_over
            return :winner if winner?
            return :draw if draw?
            false
        end        

        def draw_grid
            @grid.each do |row| 
                puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
            end
        end

        private 
        def default_grid 
            Array.new(3) { Array.new(3) { Cell.new } }    
        end

        def winning_positions
            grid +
            grid.transpose + 
            diagonals
        end

        def winning_positions_value(winning_position)
            winning_position.map { |cell| cell.value }
        end

        def diagonals
            size = grid.length
            result = []
            arr = []
            for idx in 0..(size - 1)
                arr << get_cell(idx, idx)
            end
            result << arr

            arr = []
            for idx in 0..(size - 1)
                arr << get_cell(idx, (size - 1) - idx)
            end
            result << arr
            result
        end

    end
end