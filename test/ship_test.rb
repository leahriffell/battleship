require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require "pry"

class ShipTest < Minitest::Test
  def test_it_exists
    ship = Ship.new("Cruiser", 3)
    assert_instance_of Ship, ship
  end

  def test_it_has_attributes
    ship = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", ship.name
    assert_equal 3, ship.length
    assert_equal 3, ship.health
    assert_equal false, ship.sunk?
  end

  def test_it_can_be_sunk
    ship = Ship.new("Cruiser", 3)

    cruiser.hit
    assert_equal 2, cruiser.health
    cruiser.hit
    assert_equal 1, cruiser.health
    assert_equal false, cruiser.sunk?
    cruiser.hit
    assert_equal true, cruiser.sunk?
  end
end
