# spec/board_spec.rb 
require "spec_helper"

module TicTacToe2
    describe Board do 
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
            TestCell = Struct.new(:value)
            it "sets value by position (x, y) without default grid" do 
                TestCell = Struct.new(:value)
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
    end
end