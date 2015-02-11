# /example/example_game.rb 
require_relative "../lib/hangman.rb"

puts "Welcome to Hangman"
words = []
file = "./example/5desk.txt"
#file = "Users/sleeperbus/Dev/github/Ordin/hangman/example/5desk.txt"
game = Hangman::Game.load_game
game ||= Hangman::Game.new(words: words, filename: file)
game.play


