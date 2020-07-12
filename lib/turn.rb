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
      until @computer.board.valid_coordinate?(shot_placement) == true 
       puts "Please enter a valid coordinate:"
       shot_placement = gets.chomp.upcase
      end

      @computer.board.cells[shot_placement].fire_upon
      
      display_human_shot_results(shot_placement)
  end

  def computer_shot
      shot = @human.board.cells.keys.sample(1).join
      @human.board.valid_coordinate?(shot) == true && @human.board.cells[shot].fired_upon? == false
      
      @computer.board.cells[shot].fire_upon
  end

  def display_human_shot_results(shot_placement)
    if @computer.board.cells[shot_placement].empty? == true
      puts "Your shot on #{shot_placement} was a miss."
    elsif @computer.board.cells[shot_placement].ship.sunk? == true
      puts "Your shot on #{shot_placement} sunk my #{@computer.board.cells[shot_placement].ship.name}."
    else @computer.board.cells[shot_placement].empty? == false
      puts "Your shot on #{shot_placement} was a hit."
    end
    binding.pry

  end


  #### ------ proofing methods
  def test_shot(test_shot)
    @computer.board.cells[test_shot].fire_upon
  end 

end

#@human.board.cells.values[0].fired_upon?