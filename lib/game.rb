class Game

  def initialize
    @computer = computer
    @human_player = human_player
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
  end

  def quit_game
    p "Quit method started"
  end
end
