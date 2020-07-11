require "./lib/player"

class Game
  attr_reader :human_player, :computer_player

  def initialize
    @human_player = Player.new("Human")
    @computer_player = Player.new("Computer")
  end

  def display_welcome_message
    puts "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    prompt_response = gets.chomp.upcase

    if prompt_response == "P"
      start_game  ### Needs method
    elsif prompt_response == "Q"
      quit_game ### Needs method
    else
      p "Please type P to Start or Q to quit"
    end
  end

  def start_game
    p "Start method started"
    @computer_player.randomly_place_cruiser
    @computer_player.randomly_place_submarine
    @human_player.let_human_place_cruiser
    @human_player.let_human_place_submarine
  end

  def quit_game
    p "Quit method started"
  end
end
