class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    if @ship == nil
      return true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end
end
