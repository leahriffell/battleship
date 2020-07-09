require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/player"
require "pry"

class GameTest < MiniTest::Test
  def test_it_exists
    player = Player.new

  assert_instance_of Player, player
  end
end
