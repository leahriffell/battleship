require "minitest/autorun"
require "minitest/pride"
require "./lib/turn"
require "./lib/player"
require "./lib/game"

require "pry"

class TurnTest < MiniTest::Test
  def test_it_exists
    skip
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)

    assert_instance_of Turn, turn
  end

  def test_it_displays_boards
    skip
    # computer = Player.new("Computer")
    # human = Player.new("Human")
    # turn = Turn.new(computer, human)
    game = Game.new
# binding.pry
    assert_equal "=============COMPUTER BOARD=============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n==============PLAYER BOARD==============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . .\n", game.turn.display_boards
  end

  def test_the_player_can_provide_a_valid_coordinate_as_shot
      game = Game.new
      
      assert_equal false, game.turn.player_shot.nil?
  end


end
