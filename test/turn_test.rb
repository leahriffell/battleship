require "minitest/autorun"
require "minitest/pride"
require "./lib/turn"
require "./lib/player"
require "./lib/game"

require "pry"

class TurnTest < MiniTest::Test
  def test_it_exists
    computer = Player.new("Computer", "4", "4")
    human = Player.new("Human", "4", "4")
    turn = Turn.new(computer, human)

    assert_instance_of Turn, turn
  end

  def test_it_displays_boards
    skip
    game = Game.new("4", "4")

    assert_equal "=============COMPUTER BOARD=============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n==============PLAYER BOARD==============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . .\n", game.turn.display_boards
  end

end
