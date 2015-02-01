# spec/game_spec.rb 
require "spec_helper"

module TicTacToe2 
	describe Game do
		let(:hojoon) { Player.new(name: "Hojoon", color: "X") }	
		let(:hajin) { Player.new(name: "Hajin", color: "O") }

		context "#initialize" do 
			it "randomly selects a first player" do 
				allow_any_instance_of(Array).to receive(:shuffle) { [hojoon, hajin] }			
				game = Game.new([hojoon, hajin])				
				expect(game.current_player).to eq hojoon
			end

			it "randomly selects a other player" do 
				allow_any_instance_of(Array).to receive(:shuffle) { [hojoon, hajin]}
				game = Game.new([hojoon, hajin])
				expect(game.other_player).to eq hajin
			end
		end

		context "#switch_player" do 
			it "can switch players" do 
				game = Game.new([hojoon, hajin])
				other_player = game.other_player
				game.switch_player
				expect(game.current_player).to eq other_player
			end
		end

		context "#solicit_move" do 
			it "prints message for user input" do 
				expected = "Hojoon, your turn, 1 ~ 9: "
				game = Game.new([hojoon, hajin])
				allow(game).to receive(:current_player) { hojoon }
				expect(game.solicit_move).to eq expected
			end
		end

		context "#get_move" do 
			it "returns (x, y) by user_input" do 
				game = Game.new([hojoon, hajin])
				expect(game.get_move(8)).to eq [1, 2]
			end
		end
	end
end