
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'

require "pry"

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_readable_cells
    board = Board.new
    board.generate_board_columns_and_rows

    board.cells
  end

  def test_it_has_valid_coordinates
    board = Board.new
    board.generate_board_columns_and_rows


    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
  end

  def test_it_has_equal_length_and_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end
end
