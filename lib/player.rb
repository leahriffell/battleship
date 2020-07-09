require "./lib/ship"

class Player
  attr_reader :type, :human_ships, :computer_ships

  def initialize(type)
    @type = type
    @human_ships = []
    @computer_ships = []
    generate_ships
  end

  def generate_ships
    @human_ships << Ship.new("Cruiser", 3)
    @human_ships << Ship.new("Submarine", 2)
    # binding.pry
    @computer_ships << Ship.new("Cruiser", 3)
    @computer_ships << Ship.new("Submarine", 2)
  end
end
