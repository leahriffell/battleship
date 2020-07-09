class Game
  def initialize

    display_welcome_message
  end

  def display_welcome_message

    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    # prompt_response = gets.chomp.upcase
    #
    # if prompt_response == "P"
    #   "start_game"  ### Needs method
    # elsif prompt_response == "Q"
    #   "quit_game" ### Needs method
    # else
    #   "Please type P to Start or Q to quit"
    # end
  end

  def start_game
    "Start method started"
  end

  def stop_game
    "Quit method started"
  end
end
