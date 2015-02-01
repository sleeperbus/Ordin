# spec/player.rb 
require "spec_helper"

module TicTacToe2
	describe Player do 
		context "#initialize" do 
			it "raises error if there is no initial parameters" do 
				expect { Player.new({}) }.to raise_error
			end

			it "does not raise error if there is input parameters" do
				expect { Player.new({name: "Hojoon", color: "X"}) }.not_to raise_error
			end
		end

		context "#name" do 
			it "returns player name" do 
				expect(Player.new(name: "Hojoon", color: "X").name).to eq "Hojoon"
			end
		end

		context "#color" do 
			it "returns player color" do 
				expect(Player.new(name: "Hojoon", color: "X").color).to eq "X"
			end
		end
	end
end
