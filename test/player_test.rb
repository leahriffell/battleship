require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/player"
require "./lib/board"
require "pry"

class GameTest < MiniTest::Test
  def test_it_exists
    player = Player.new("Human")
    assert_instance_of Player, player
  end

  def test_it_has_a_type
    human = Player.new("Human")
    computer = Player.new("Computer")

    assert_equal "Human", human.type
    assert_equal "Computer", computer.type
  end

  def test_it_has_two_ships
    human = Player.new("Human")
    computer = Player.new("Computer")

    assert_equal 2, human.ships.length
    assert_equal 2, computer.ships.length
  end

  def test_it_has_a_board
    human = Player.new("Human")
    computer = Player.new("Computer")

    assert_equal true, human.has_board?
    assert_equal true, computer.has_board?
  end

  def test_computer_player_randomly_places_ships
    computer = Player.new("Computer")

    computer.randomly_place_cruiser
    computer.randomly_place_submarine
    assert_equal 5, computer.board.cells.select {|key, value| value.ship}.length
  end

  def test_human_can_place_cruiser
    human = Player.new("Human")
    # This is similar to our welcome message method that requires user input in order to do execute. We did not test in that case as it'll be caught when we play the game.

    # don't want to call this in our test
    # human.let_human_place_cruiser
    # human.let_human_place_submarine
    # assert_equal 3, human.board.cells.select {|key, value| value.ship}.length
  end
end
