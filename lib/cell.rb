class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate, ship = nil, fired_upon = false)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
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

  def fire_upon
    # fire upon will decrement ship health and also change fired_upon to true
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render
    if @fired_upon == true && @ship == nil
      "M"
    else
      "."
    end
  end
end
