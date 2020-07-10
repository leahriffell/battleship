require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/player"
require "pry"

class GameTest < MiniTest::Test
  def test_it_exists
    player = Player.new("Human")
    assert_instance_of Player, player
  end

  def test_it_has_a_type
    human = Player.new("Human")
    computer = Player.new("Computer")

    assert_equal "Human", human.type
    assert_equal "Computer", computer.type
  end

  def test_it_has_two_ships
    human = Player.new("Human")
    computer = Player.new("Computer")

    assert_equal 2, human.ships.length
    assert_equal 2, computer.ships.length
  end
end
