class Ship
  attr_reader :name, :length, :health
  def initialize(name, length)
    @name = name
    @length = length
    # @sunk = false
    @health = @length
  end

  def sunk?
    return true if health == 0; false
  end

  def hit
    @health -= 1
  end
end
