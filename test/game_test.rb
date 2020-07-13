require "minitest/autorun"
require "minitest/pride"
require "./lib/game"
require "./lib/player"
require "./lib/board"
require "pry"

class GameTest < MiniTest::Test
  def test_it_exist
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_human_and_computer_player
    game = Game.new

    assert_equal "Human", game.human_player.type
    assert_equal "Computer", game.computer_player.type
  end

  def test_it_has_assigned_boards
    game = Game.new

    assert_equal true, game.human_player.has_board?
    assert_equal true, game.computer_player.has_board?
  end

end
