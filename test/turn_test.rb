require "minitest/autorun"
require "minitest/pride"
require "./lib/turn"
require "./lib/player"
require "pry"

class TurnTest < MiniTest::Test
  def test_it_exists
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)

    assert_instance_of Turn, turn
  end

  def test_it_displays_boards
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)

    assert_equal "=============COMPUTER BOARD=============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n==============PLAYER BOARD==============\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . .", turn.display_boards
  end
end
