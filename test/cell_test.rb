require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/cell'
require "pry"

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
    assert_nil cell.ship
  end

  def test_if_cell_is_empty
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
  end

  def test_if_cell_is_not_empty
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal true, cell.empty?
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
    assert_equal false, cell.empty?
  end

  def test_cell_can_be_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end

  def test_cell_can_render_if_missed
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_cell_can_render_ship_upon_request
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)
  end

  def test_cell_can_render_ship_if_hit_or_sunk
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    cell_2.fire_upon

    assert_equal "H", cell_2.render
    assert_equal false, cruiser.sunk?
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_2.render
  end
end
