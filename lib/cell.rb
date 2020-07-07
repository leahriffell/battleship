class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    if @ship == nil
      return true
    end
  end
end
