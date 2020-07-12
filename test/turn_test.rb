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

  def test_the_human_can_provide_a_valid_coordinate_as_shot
    skip
      game = Game.new
      assert_equal false, game.turn.human_shot.nil? # => This tests the method is returning something and it is not nil.
  end

  def test_the_computer_can_provide_a_valid_coordinate_as_shot
    skip
    game = Game.new

    assert_equal false, game.turn.computer_shot.nil?
  end

  def test_it_we_can_shoot_a_custom_coordinate
    # skip
    game = Game.new
    game.start_game
    game.turn.test_shot("A4")

    assert_equal true, game.turn.computer.board.cells["A4"].fired_upon? 
  end 

end
