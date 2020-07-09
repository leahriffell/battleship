require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/player"
require "pry"

class GameTest < MiniTest::Test
  def test_it_exists
    player = Player.new("human")

    assert_instance_of Player, player
  end

  def test_player_type
    human = Player.new("human")
    computer = Player.new("computer")

    assert_equal "human", human.type
    assert_equal "computer", computer.type
  end
end
