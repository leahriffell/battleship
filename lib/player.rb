require "./lib/ship"
require "./lib/board"

class Player
attr_reader :type, :ships, :board

  def initialize(type)
  @type = type
  @ships = []
  @board = board
  # @human_ships = []
  # @computer_ships = []
  generate_ships
  assign_board
  end

  def generate_ships
  @ships << Ship.new("Cruiser", 3)
  @ships << Ship.new("Submarine", 2)

  # @human_ships << Ship.new("Cruiser", 3)
  # @human_ships << Ship.new("Submarine", 2)
  # @computer_ships << Ship.new("Cruiser", 3)
  # @computer_ships << Ship.new("Submarine", 2)
  end

  def assign_board
  @board = Board.new
  end

  def has_board?
  @board.class == Board
  end

  def random_coordinate
    board.cells.keys.sample(1).join
  end

  def random_coordinate_array(ship_length)
    placed_coordinates = []
    ship_length.times do
      placed_coordinates << random_coordinate
    end
    placed_coordinates
  end

  def valid_random_coordinate_array_cruiser
      x = random_coordinate_array(@ships[0].length)
      until @board.valid_placement?(@ships[0], x) == true do
        x = random_coordinate_array(@ships[0].length)
      end
      x
  end

  def valid_random_coordinate_array_sub
      x = random_coordinate_array(@ships[1].length)
      until @board.valid_placement?(@ships[1], x) == true do
        x = random_coordinate_array(@ships[1].length)
      end
      x
  end

  def randomly_place_cruiser
    @board.place(@ships[0],(valid_random_coordinate_array_cruiser))
  end

  def randomly_place_submarine
    @board.place(@ships[1],(valid_random_coordinate_array_sub))
  end

end
