require "./lib/ship"
require "./lib/board"

class Player
attr_reader :type, :ships, :board, :num_columns, :num_rows

  def initialize(type, num_columns, num_rows)
    @type = type
    @ships = []
    @board = board
    @num_columns = num_columns
    @num_rows = num_rows
    generate_ships
    assign_board
  end

  def generate_ships
  @ships << Ship.new("Cruiser", 3)
  @ships << Ship.new("Submarine", 2)
  end

  def assign_board
  @board = Board.new(@num_columns, @num_rows)
  end

  def has_board?
  @board.class == Board
  end

# this method should probably belong to board class
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

  def valid_random_coordinate_array_submarine
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
    @board.place(@ships[1],(valid_random_coordinate_array_submarine))
  end

  def let_human_place_cruiser
    puts "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the submarine is two units long."
    puts @board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    desired_placement = gets.chomp.upcase.split

    until @board.valid_placement?(@ships[0],desired_placement) == true
      puts "Those are invalid coordinates. Please try again:"
      desired_placement = gets.chomp.upcase.split
    end
    @board.place(@ships[0],desired_placement)
    puts @board.render(true)
  end

  def let_human_place_submarine
    puts "Enter the squares for the Submarine (2 spaces):"
    desired_placement = gets.chomp.upcase.split

    until @board.valid_placement?(@ships[1],desired_placement) == true
      puts "Those are invalid coordinates. Please try again:"
      desired_placement = gets.chomp.upcase.split
    end
    @board.place(@ships[1],desired_placement)
    puts "Ahoy, your ships have been placed!"
    puts @board.render(true)
  end

end
