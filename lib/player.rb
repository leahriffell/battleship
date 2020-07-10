require "./lib/ship"

class Player
  attr_reader :type, :ships

  def initialize(type)
    @type = type
    @ships = []
    # @human_ships = []
    # @computer_ships = []
    generate_ships
  end

  def generate_ships
    @ships << Ship.new("Cruiser", 3)
    @ships << Ship.new("Submarine", 2)

    # @human_ships << Ship.new("Cruiser", 3)
    # @human_ships << Ship.new("Submarine", 2)
    # @computer_ships << Ship.new("Cruiser", 3)
    # @computer_ships << Ship.new("Submarine", 2)
  end
end
