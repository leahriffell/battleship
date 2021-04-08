class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate, ship = nil, fired_upon = false)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired_upon = true
    @ship&.hit
  end

  def fired_upon?
    @fired_upon
  end

  def miss
    @fired_upon && @ship.nil?
  end

  def sunk
    @fired_upon && !@ship.nil? && @ship.sunk?
  end

  def hit
    @fired_upon && !@ship.nil?
  end

  def render(ship_display = false)
    if ship_display
      empty? ? '.' : 'S'
    else
      if miss
        'M'
      elsif sunk
        'X'
      elsif hit
        'H'
      else
        '.'
      end
    end
  end
end
