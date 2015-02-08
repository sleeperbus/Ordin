# /example/example_game.rb 
require_relative "../lib/hangman.rb"

puts "Welcome to Hangman"
game = Hangman::Game.new(["Hello", "World", "Mac", "iphone", "ipad"])
game.play


