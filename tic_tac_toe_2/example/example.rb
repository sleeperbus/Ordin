# /example/example_game.rb 
require_relative "../lib/tic_tac_toe_2.rb"

puts "Welcome to tic tac toe"
hojoon = TicTacToe2::Player.new({color: "X", name: "Hojoon"})
hajin = TicTacToe2::Player.new({color: "O", name: "Hajin"})
players = [hojoon, hajin]
TicTacToe2::Game.new(players).play


