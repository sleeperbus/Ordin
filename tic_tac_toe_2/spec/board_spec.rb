# spec/board_spec.rb 
require "spec_helper"

module TicTacToe2
    describe Board do
        TestCell = Struct.new(:value)
        context "#initialize" do 
            it "is initialized with any value" do
                expect(Board.new(grid: "test").grid).to eq "test"
            end
            
            it "is initialized with default 3 rows" do 
                expect(Board.new.grid).to have(3).things
            end
            
            it "creates 3 by 3, nested array by default" do 
                board = Board.new 
                board.grid.each do |row|
                    expect(row).to have(3).things 
                end
            end
        end  
        
        context "#grid" do 
            it "returns grid whatever initialized" do 
                board = Board.new(grid: "whatever")
                expect(board.grid).to eq "whatever"
            end
        end
        
        context "#get_cell" do 
            it "returns a cell by (x, y) position" do 
                grid = [["", "", ""], ["me", "", ""], ["you", "", ""]]
                board = Board.new(grid: grid)
                expect(board.get_cell(0, 1)).to eq "me"
            end
        end
        
        context "#set_cell" do 
            it "sets value by position (x, y) without default grid" do 
                cell = TestCell.new("me")
                board = Board.new
                board.set_cell(2, 1, cell.value)
                expect(board.get_cell(2, 1).value).to eq "me"
            end
            
            it "sets value by position(x, y) with some grid" do 
                grid = [
                    [TestCell.new, "", ""],
                    ["", "", TestCell.new("me")],
                    ["", "", ""]
                ]
                board = Board.new(grid: grid)
                board.set_cell(2, 1, "you")
                expect(board.get_cell(2, 1).value).to eq "you"
            end
        end

        context "#draw?" do 
            it "returns true if all cells have a value" do 
                grid = [
                    [TestCell.new("X"), TestCell.new("Y")],
                    [TestCell.new("A"), TestCell.new("B")]
                ]
                board = Board.new(grid: grid) 
                expect(board.draw?).to be true
            end

            it "returns false when there are some empty cell" do 
                grid = [
                    [TestCell.new, TestCell.new("Y")],
                    [TestCell.new("A"), TestCell.new("B")]
                ]
                board = Board.new(grid: grid) 
                expect(board.draw?).to be false
            end
        end

        context "#winner?" do 
            it "returns true if there is at least one straight line" do
                grid = [
                    [TestCell.new("X"), TestCell.new("Y"), TestCell.new("X")],
                    [TestCell.new, TestCell.new("X"), TestCell.new("X")],
                    [TestCell.new("X"), TestCell.new, TestCell.new]
                ]
                board = Board.new(grid: grid) 
                expect(board.winner?).to be true
            end

            it "returns false if grid is empty" do 
                grid = [
                    [TestCell.new, TestCell.new, TestCell.new],
                    [TestCell.new, TestCell.new, TestCell.new],
                    [TestCell.new, TestCell.new, TestCell.new]
                ]
                board = Board.new(grid: grid) 
                expect(board.winner?).to be false
            end

            it "returns false if there is no straight line" do 
                grid = [
                    [TestCell.new("X"), TestCell.new("Y"), TestCell.new("X")],
                    [TestCell.new, TestCell.new("Y"), TestCell.new("X")],
                    [TestCell.new("X"), TestCell.new, TestCell.new]
                ]
                board = Board.new(grid: grid) 
                expect(board.winner?).to be false
            end
        end

        context "#is_empty?" do 
            grid = [
                [TestCell.new("X"), TestCell.new("Y"), TestCell.new("X")],
                [TestCell.new, TestCell.new("Y"), TestCell.new("X")],
                [TestCell.new("X"), TestCell.new, TestCell.new]
            ]
            board = Board.new(grid: grid) 

            it "returns true if cell(x, y) is empty" do 
                expect(board.is_empty?(0, 1)).to be true
            end

            it "returns true if cell(x, y) is empty" do 
                expect(board.is_empty?(0, 2)).to be false
            end
        end

        context "#game_over" do 
            it "returns :winner if there is straight line" do 
                grid = [
                    [TestCell.new("X"), TestCell.new("Y"), TestCell.new("X")],
                    [TestCell.new, TestCell.new("X"), TestCell.new("X")],
                    [TestCell.new("X"), TestCell.new, TestCell.new]
                ]
                board = Board.new(grid: grid) 
                expect(board.game_over).to be :winner
            end

            it "returns :draw if there is straight line" do 
                grid = [
                    [TestCell.new("X"), TestCell.new("Y"), TestCell.new("X")],
                    [TestCell.new("Y"), TestCell.new("X"), TestCell.new("X")],
                    [TestCell.new("Y"), TestCell.new("X"), TestCell.new("Y")]
                ]
                board = Board.new(grid: grid) 
                expect(board.game_over).to be :draw
            end
        end


        # context "#diagonals" do 
        #     it "returns diagonals array" do 
        #         grid = [
        #             [TestCell.new("1"), TestCell.new("2"), TestCell.new("3")],
        #             [TestCell.new("4"), TestCell.new("5"), TestCell.new("6")],
        #             [TestCell.new("7"), TestCell.new("8"), TestCell.new("9")]
        #         ]
        #         result = [["1", "5", "9"], ["7", "5", "3"]]
        #         board = Board.new(grid: grid)
        #         expect(board.diagonals.flatten.map { |cell| cell.value }).to eq result.flatten
        #     end
        # end
    end
end