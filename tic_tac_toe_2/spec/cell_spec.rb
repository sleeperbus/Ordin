# spec/cell_spec.rb"
require "spec_helper"

module TicTacToe2
    describe Cell do 
        context "#initialize" do 
            it "is initialized with value of '' by default" do 
                cell = Cell.new
                expect(cell.value).to eq ""
            end
            
            it "is initialized with value of 'X'" do 
                cell = Cell.new("X")
                expect(cell.value).to eq "X" 
            end
        end 
    end
end