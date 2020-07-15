require "./lib/player"
require "./lib/turn"

class Game
  attr_reader :human_player, :computer_player, :turn, :num_columns, :num_rows

  def initialize(num_columns, num_rows)
    # @num_columns = num_columns
    # @num_rows = num_rows
    @human_player = Player.new("Human", num_columns, num_rows)
    @computer_player = Player.new("Computer", num_columns, num_rows)
    @turn = Turn.new(@human_player, @computer_player)
    @computer_player.randomly_place_cruiser
    @computer_player.randomly_place_submarine
  end

  def play_the_game
    loop do
      display_welcome_message
    end
  end

  def display_welcome_message
    puts "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    prompt_response = gets.chomp.upcase

    if prompt_response == "P" ## split the following methods
      play_the_game
    elsif prompt_response == "Q"
      puts "Thanks for playing!"
      exit
    else
      p "Please type P to Start or Q to quit"
    end
  end

  def play_the_game
    place_ships
  binding.pry
    play_turns
    display_winner
  end

  def game_over?
    # maybe have helper method b/c both sides of or statements are very similar (just calling on different player objects)
    @computer_player.ships.all? {|ship| ship.health == 0} || @human_player.ships.all? {|ship| ship.health == 0}
  end

  def place_ships
    @human_player.let_human_place_cruiser #tweak these so gets chomp and render are separated
    @human_player.let_human_place_submarine
  end

  def play_turns
    until game_over? == true
      puts @turn.display_boards
      @turn.human_shot
      @turn.computer_shot
    end
  end

  def display_winner
    if game_over? == true
      # same code that we used above to determine if game over
      if @computer_player.ships.all? {|ship| ship.health == 0}
        puts "You won!"
      else @human_player.ships.all? {|ship| ship.health == 0}
        puts "I won!"
      end
    end
  end

end
