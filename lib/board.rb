
class Board
  attr_reader :cells
  def initialize
  @cells = {}
  end

  def generate_board_columns_and_rows
    columns = ("A".."D").to_a
    rows = ("1".."4").to_a
    coordinates = []

    columns.each do |column|
        rows.each do |row| row.to_s
        coordinates <<  "#{column}#{row}"
        end
    end

    @cells = Hash[coordinates.collect { |coordinate| [coordinate, Cell.new(coordinate)] } ]
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship_type, coordinates)
    ship_type.length == coordinates.length
  end

end
