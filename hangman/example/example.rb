# /example/example_game.rb 
require_relative "../lib/hangman.rb"

puts "Welcome to Hangman"
words = ["Hello", "World", "Mac", "iphone", "ipad"]
game = Hangman::Game.new(words: words)
game.play


