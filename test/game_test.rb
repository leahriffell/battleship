require "minitest/autorun"
require "minitest/pride"
require "./lib/game"
require "pry"

class GameTest < MiniTest::Test
  def test_it_exist
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_displays_welcome_mssg_on_setup
    game = Game.new

    assert_equal "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.", game = Game.new
  end

  def test_computer_has_two_ships
    game = Game.new

    assert_equal 2, computer.ships
  end
end
