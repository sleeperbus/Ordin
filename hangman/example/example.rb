# /example/example_game.rb 
require_relative "../lib/hangman.rb"

puts "Welcome to Hangman"
words = []
file = "/Users/sleeperbus/Dev/github/Ordin/hangman/example/5desk.txt"
game = Hangman::Game.new(words: words, filename: file)
game.play


