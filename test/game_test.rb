require "minitest/autorun"
require "minitest/pride"
require "./lib/game"
require "./lib/player"
require "pry"

class GameTest < MiniTest::Test
  def test_it_exist
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_displays_welcome_mssg_on_setup
    skip
    game = Game.new

    assert_equal "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.", game = Game.new
  end

  def test_game_has_human_and_computer_player
    game = Game.new

    assert_equal "Human", game.human_player.type
    assert_equal "Computer", game.computer_player.type
  end
end
