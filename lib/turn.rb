class Turn
  attr_reader :computer, :human

  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def display_boards
    # trying to use return instead of puts (like board render method)
     "=============COMPUTER BOARD=============\n" +
     "#{@computer.board.render}" +
     "==============PLAYER BOARD==============\n" +
     "#{@human.board.render(true)}"
  end

  def human_shot
    puts "Enter the coordinate for your shot:"
    shot_placement = gets.chomp.upcase.to_s
    until @computer.board.valid_coordinate?(shot_placement) == true && @computer.board.cells[shot_placement].fired_upon? == false
      if @computer.board.valid_coordinate?(shot_placement) == true && @computer.board.cells[shot_placement].fired_upon? == true
          puts "You have already fired upon this coordinate. Please enter a different one."
          shot_placement = gets.chomp.upcase
      else @computer.board.valid_coordinate?(shot_placement) == false
          puts "Please enter a valid coordinate:"
          shot_placement = gets.chomp.upcase
      end
    end
    @computer.board.cells[shot_placement].fire_upon
    display_human_shot_results(shot_placement)
  end

  def computer_shot
      shot_placement = @human.board.cells.keys.sample(1).join
      @human.board.valid_coordinate?(shot_placement) == true && @human.board.cells[shot_placement].fired_upon? == false

      @human.board.cells[shot_placement].fire_upon
      display_computer_shot_results(shot_placement)
  end

  def display_human_shot_results(shot_placement)
    if @computer.board.cells[shot_placement].empty? == true
      puts "Your shot on #{shot_placement} was a miss."
    elsif @computer.board.cells[shot_placement].ship.sunk? == true
      puts "Your shot on #{shot_placement} sunk my #{@computer.board.cells[shot_placement].ship.name}."
    else @computer.board.cells[shot_placement].empty? == false
      puts "Your shot on #{shot_placement} was a hit."
    end
  end

  def display_computer_shot_results(shot_placement)
    if @human.board.cells[shot_placement].empty? == true
      puts "My shot on #{shot_placement} was a miss."
    elsif @human.board.cells[shot_placement].ship.sunk? == true
      puts "My shot on #{shot_placement} sunk your #{@human.board.cells[shot_placement].ship.name}."
    else @human.board.cells[shot_placement].empty? == false
      puts "My shot on #{shot_placement} was a hit."
    end
  end

  #### ------ proofing methods
  def test_shot(test_shot)
    @computer.board.cells[test_shot].fire_upon
  end

end

#@human.board.cells.values[0].fired_upon?
