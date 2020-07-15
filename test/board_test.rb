
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'

require "pry"

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new("4", "4")
    assert_instance_of Board, board
  end

  def test_it_has_readable_cells
    board = Board.new("4", "4")

    assert_equal 16, board.cells.keys.length
  end

  def test_it_has_valid_coordinates
    board = Board.new("4", "4")

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
  end

  def test_placement_has_equal_length_and_coordinates
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_placement_has_consecutive_coordinates
    # skip
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(cruiser, ["C1", "B1"])
  end

  def test_placement_does_not_have_diagonal_coordinates
    # skip
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_placement_is_valid
    # skip
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A4", "A5"])
  end

  def test_ship_belongs_to_multiple_cells
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_no_overlapping_ships
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_it_can_render
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["B1", "B2", "B3"])
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render
  end

  def test_it_can_render_with_ships_showing
    board = Board.new("4", "4")
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])
    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", board.render(true)
  end

end
