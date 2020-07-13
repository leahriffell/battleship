require "./lib/player"
require "./lib/turn"

class Game
  attr_reader :human_player, :computer_player, :turn

  def initialize
    @human_player = Player.new("Human")
    @computer_player = Player.new("Computer")
    @turn = Turn.new(@human_player, @computer_player)
  end

  def play_the_game
    loop do
      display_welcome_message
    end
  end

  def display_welcome_message
    puts "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    prompt_response = gets.chomp.upcase

    if prompt_response == "P"
      place_ships
      play_turns
      display_winner
    elsif prompt_response == "Q"
      puts "Thanks for playing!"
      exit
    else
      p "Please type P to Start or Q to quit"
    end
  end

  def game_over?
    # maybe have helper method b/c both sides of or statements are very similar (just calling on different player objects)
    @computer_player.ships.all? {|ship| ship.health == 0} || @human_player.ships.all? {|ship| ship.health == 0}
  end

  def place_ships
    @computer_player.randomly_place_cruiser
    @computer_player.randomly_place_submarine
    @human_player.let_human_place_cruiser
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
