x
require 'pry'
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
    # If rows all the same ordinal value, then column ordinal values must be different (equal to the coordinate length)
    # If columns are all the same ordinal value, then row ordinal values must be different (equal to coordinate length)
    # If the length of range of column ordinal values equals 1, then the length of row ordinal values must equal length of coordinates array passed in
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
end
