class Turn
  attr_reader :computer, :human

  def initialize(computer, human)
    @computer = computer
    @human = human
  end

  def display_boards
    # trying to use return instead of puts (like board render method)
     "=============COMPUTER BOARD=============\n" +
     "#{@computer.board.render}" +
     "==============PLAYER BOARD==============\n" +
     "#{@human.board.render(true)}"
  end

  def player_shot
      puts "Enter the coordinate for your shot:"
      desired_placement = gets.chomp.upcase.to_s
      until @computer.board.valid_coordinate?(desired_placement) == true 
       puts "Please enter a valid coordinate:"
       desired_placement = gets.chomp.upcase
      end

      @computer.board.cells[desired_placement].fire_upon
  end

  def computer_shot
      shot = @human.board.cells.keys.sample(1).join
      @human.board.valid_coordinate?(shot) == true && @human.board.cells[shot].fired_upon? == false
      
      @computer.board.cells[shot].fire_upon
  end

  def results
    @computer.board.cells[shot].render 
  end


  #### ------ proofing methods
  def test_shot(test_shot)
    @computer.board.cells[test_shot].fire_upon
  end 

end

#@human.board.cells.values[0].fired_upon?