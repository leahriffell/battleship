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

  def test_game_has_human_and_computer_player
    game = Game.new

    assert_equal "Human", game.human_player.type
    assert_equal "Computer", game.computer_player.type
  end
end
