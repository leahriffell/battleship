require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/player'
require './lib/board'
require 'pry'

class GameTest < MiniTest::Test
  def test_it_exists
    player = Player.new(:human, '4', '4')
    assert_instance_of Player, player
  end

  def test_it_has_a_type
    human = Player.new(:human, '4', '4')
    computer = Player.new(:computer, '4', '4')

    assert_equal :human, human.type
    assert_equal :computer, computer.type
  end

  def test_it_has_two_ships
    human = Player.new(:human, '4', '4')
    computer = Player.new(:computer, '4', '4')

    assert_equal 2, human.ships.length
    assert_equal 2, computer.ships.length
  end

  def test_it_has_a_board
    human = Player.new(:human, '4', '4')
    computer = Player.new(:computer, '4', '4')

    assert_equal Board, human.board.class
    assert_equal Board, computer.board.class
  end

  def test_computer_player_randomly_places_ships
    computer = Player.new(:computer, '4', '4')

    computer.randomly_place_cruiser
    computer.randomly_place_submarine

    length_of_all_ships = computer.board.cells.select { |_key, value| value.ship }.length

    assert_equal 5, length_of_all_ships
  end
end
