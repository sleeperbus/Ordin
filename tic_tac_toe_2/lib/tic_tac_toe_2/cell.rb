# lib/tic_tac_toe_2/cell.rb 
module TicTacToe2
    class Cell 
        attr_accessor :value 
        def initialize(value = "") 
            @value = value
        end
    end
end