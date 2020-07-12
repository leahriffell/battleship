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
      # binding.pry
      until @computer.board.valid_coordinate?(desired_placement) == true 
        # binding.pry
       puts "Please enter a valid coordinate:"
       desired_placement = gets.chomp.upcase
      end
      desired_placement
  end
  
  def computer_shot
      shot = @human.board.cells.keys.sample(1).join
      @human.board.valid_coordinate?(shot) == true && @human.board.cells[shot].fired_upon? == false
      p shot

  end
end

#@human.board.cells.values[0].fired_upon?