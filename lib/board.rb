require 'pry'
class Board
  attr_reader :cells
  def initialize
  @cells = {}
  generate_board_columns_and_rows # call method to generate cell for board.
  end

  def generate_columns
    ("A".."D").to_a
  end

  def generate_rows
    ("1".."4").to_a
  end

  def generate_board_columns_and_rows
    generate_columns
    generate_rows
    coordinates = []

    generate_columns.each do |column|
        generate_rows.each do |row| row.to_s
        coordinates <<  "#{column}#{row}"
        end
    end

    @cells = Hash[coordinates.collect { |coordinate| [coordinate, Cell.new(coordinate)] } ]
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship_type, coordinates)
    # If rows all the same ordinal value, then column ordinal values must be different (equal to the coordinate length)
    # If columns are all the same ordinal value, then row ordinal values must be different (equal to coordinate length)
    # If the length of range of column ordinal values equals 1, then the length of row ordinal values must equal length of coordinates array passed in
    return false unless no_overlap?(coordinates)

    column_ordinals =
      coordinates.map do |coordinate|
        coordinate[0].ord
      end

    row_ordinals =
      coordinates.map do |coordinate|
        coordinate[1].ord
      end

    column_ordinal_range = (column_ordinals.min..column_ordinals.max).to_a

    row_ordinal_range = (row_ordinals.min..row_ordinals.max).to_a

    ship_type.length == coordinates.length &&
    (column_ordinal_range.length == 1 && row_ordinal_range.length == coordinates.length || column_ordinal_range.length == coordinates.length && row_ordinal_range.length == 1)
    # binding.pry
  end

  def place(ship_type, coordinates)
    if valid_placement?(ship_type, coordinates)
      coordinates.map do |coordinate|
        @cells[coordinate].place_ship(ship_type)
      end
    end
  end

  def no_overlap?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def render(ship_display = false)
    # binding.pry
    p generate_columns
    p generate_rows
    binding.pry
  end

end
