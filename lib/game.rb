require './lib/player'
require './lib/turn'

class Game
  attr_reader :num_columns, :num_rows, :human_player, :computer_player

  def initialize
    @num_columns = '4'
    @num_rows = '4'
    @human_player = Player.new(:human, @num_columns, @num_rows)
    @computer_player = Player.new(:computer, @num_columns, @num_rows)
  end

  def start_the_game
    loop do
      display_welcome_message
    end
  end

  private
  
  def create_human_player
    @human_player = Player.new(:human, @num_columns, @num_rows)
  end

  def create_computer_player
    @computer_player = Player.new(:computer, @num_columns, @num_rows)
  end

  def display_welcome_message
    puts 'Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.'
    prompt_response = gets.chomp.upcase

    if prompt_response == 'P' ## split the following methods
      play_the_game
    elsif prompt_response == 'Q'
      puts 'Thanks for playing!'
      exit
    else
      p 'Please type P to Start or Q to quit'
    end
  end

  def get_num_of_columns
    puts 'Enter the number of columns that you want on the board'
    @num_columns = gets.chomp
  end

  def get_num_of_rows
    puts 'Enter the number of rows that you want on the board'
    @num_rows = gets.chomp.upcase
  end

  def play_the_game
    get_num_of_rows
    get_num_of_columns
    create_human_player
    create_computer_player
    @turn = Turn.new(@human_player, @computer_player)
    place_ships
    play_turns
    display_winner
  end

  def game_over?
    # maybe have helper method b/c both sides of or statements are very similar (just calling on different player objects)
    @computer_player.ships.all? { |ship| ship.health == 0 } || @human_player.ships.all? { |ship| ship.health == 0 }
  end

  def place_ships
    @computer_player.randomly_place_cruiser
    @computer_player.randomly_place_submarine
    @human_player.let_human_place_cruiser
    @human_player.let_human_place_submarine
  end

  def play_turns
    until game_over?
      puts @turn.display_boards
      @turn.human_shot
      @turn.computer_shot
    end
  end

  def display_winner
    if @computer_player.ships.all? { |ship| ship.health == 0 }
      puts 'You won!'
    else @human_player.ships.all? { |ship| ship.health == 0 }
      puts 'I won!'
    end
  end
end
