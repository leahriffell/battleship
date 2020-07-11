require 'pry'
require "./lib/cell"

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

  def consecutive_rows?(coordinates)
    coordinate_rows = coordinates.map {|coordinate| coordinate[-1]}
    row_range = (coordinate_rows[0]..coordinate_rows[-1]).to_a
    coordinate_rows == row_range
  end

  def consecutive_columns?(coordinates)
    coordinate_columns = coordinates.map {|coordinate| coordinate[0]}
    column_range = (coordinate_columns[0]..coordinate_columns[-1]).to_a
    coordinate_columns == column_range
  end

  def consecutive_rows_or_columns?(coordinates)
    consecutive_rows?(coordinates) || consecutive_columns?(coordinates)
  end

  def no_overlap?(coordinates)
    coordinates.all? do |coordinate|
      if @cells[coordinate].nil?
        # require "pry"; binding.pry
      else
      @cells[coordinate].empty?
      end
    end
  end

  def return_ordinals(coordinates, index)
    coordinates.map do |coordinate|
      coordinate[index].ord
    end
  end

  def column_ordinal_range(coordinates)
    (return_ordinals(coordinates, 0).min..return_ordinals(coordinates, 0).max).to_a
  end

  def row_ordinal_range(coordinates)
    (return_ordinals(coordinates, 1).min..return_ordinals(coordinates, 1).max).to_a
  end

  def not_diagonal?(coordinates)
  # If rows all the same ordinal value, then column ordinal values must be different (equal to the coordinate length) and vice-versa
    column_ordinal_range(coordinates).length == 1 && row_ordinal_range(coordinates).length == coordinates.length || column_ordinal_range(coordinates).length == coordinates.length && row_ordinal_range(coordinates).length == 1
  end

  def valid_placement?(ship_type, coordinates)
    no_overlap?(coordinates) && consecutive_rows_or_columns?(coordinates) && ship_type.length == coordinates.length && not_diagonal?(coordinates)
  end

  def place(ship_type, coordinates)
    if valid_placement?(ship_type, coordinates) == true
      coordinates.map do |coordinate|
        @cells[coordinate].place_ship(ship_type)
      end
    end
  end

  def render(ship_display = false)
    # For us, the rows and columns flip flopped for now (columns are alphabetical, rows are numeral)

    # This rendering of cells array could be a helper method
    rendered_cells = []
    @cells.each do |coordinate, cell_instance|
      if ship_display == true
        rendered_cells << "#{cell_instance.render(true)} "
      else ship_display == false
        rendered_cells << "#{cell_instance.render} "
      end
    end

    # At this point, rows AND cells within the rows are not dynamic
    "  #{generate_columns.join(" ")} \n" +
    "1 #{rendered_cells[0..3].join("")}\n" +
    "2 #{rendered_cells[4..7].join("")}\n" +
    "3 #{rendered_cells[8..11].join("")}\n" +
    "4 #{rendered_cells[12..15].join("")}\n"
  end

# Nico and Melvin's session work
#   def render(ship_display = false)
#   row = 1
#   @cells.each_slice(4).to_a.transpose.reduce(”  A B C D”) do |state, cell_group|
#     x = cell_group.map do |key, value|
#       if ship_display == true
#         value.render(true)
#       else
#         value.render
#       end
#     end
#     y = “\n#{row} #{x.join(' ’)}”
#     row += 1
#     state = state + y
#   end.concat(” \n”)
end
