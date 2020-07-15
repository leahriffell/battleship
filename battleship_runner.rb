require "./lib/game"

puts "Enter the number of columns that you want on the board"
num_columns = gets.chomp
puts "Enter the number of rows that you want on the board"
num_rows = gets.chomp.upcase

game = Game.new(num_columns, num_rows)
game.play_the_game

## refactor to get the user input in one time
