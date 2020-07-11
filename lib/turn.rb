class Turn
  attr_reader :computer, :human

  def initialize(computer, human)
    @computer = computer
    @human = human
  end

  def display_boards
    # trying to use return instead of puts (like board render method)
     "=============COMPUTER BOARD=============\n" +
     "#{@computer.board.render}\n" +
     "==============PLAYER BOARD==============\n" +
     "#{@human.board.render}\n"
  end
end
