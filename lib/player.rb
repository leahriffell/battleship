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

#goes on board class
def coordinate_on_next_row(coordinate)
  "#{coordinate[0]}#{coordinate[1].to_i + 1}"
end

#also goes on board class
def coordinate_in_next_column(coordinate)
  "#{coordinate[0].next}#{coordinate[1]}"
end

def random_coordinate
  board.cells.keys.sample(1).join
end

def random_coordinate_array
  placed_coordinates = []
  first_coordinate = random_coordinate
  placed_coordinates << first_coordinate
  placed_coordinates << coordinate_on_next_row(first_coordinate)
  placed_coordinates
end

def randomly_place_ships
  random_coordinates = random_coordinate_array
  if @board.place(@ships[1], random_coordinates) == nil
    "no good coordinates!"
  else
    @board.place(@ships[1], random_coordinates)
  end
end
end
