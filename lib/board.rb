require 'pry'
require "./lib/cell"
require "./lib/game"


class Board
  attr_reader :cells, :num_columns, :num_rows
  def initialize(num_columns, num_rows)
    @num_columns = num_columns
    @num_rows = num_rows
    @cells = {}
    generate_board_columns_and_rows # call method to generate cell for board.
  end

  def generate_rows
    # ("A"..num_rows).to_a
    ("A"..(("A".ord + num_rows.to_i)-1).chr).to_a
  end

  def generate_columns
    ("1"..num_columns).to_a
  end

  def generate_board_columns_and_rows
    coordinates = []

    generate_rows.each do |row|
        generate_columns.each do |column| column.to_s
        coordinates <<  "#{row}#{column}"
        end
    end

    coordinates.each do |coord|
      @cells[coord] = Cell.new(coord)
    end
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def consecutive_columns?(coordinates)
    coordinate_columns = coordinates.map {|coordinate| coordinate[0]}
    column_range = (coordinate_columns[0]..coordinate_columns[-1]).to_a
    coordinate_columns == column_range
  end

  def consecutive_rows?(coordinates)
    coordinate_rows = coordinates.map {|coordinate| coordinate[-1]}
    row_range = (coordinate_rows[0]..coordinate_rows[-1]).to_a
    coordinate_rows == row_range
  end

  def consecutive_columns_or_rows?(coordinates)
    consecutive_columns?(coordinates) || consecutive_rows?(coordinates)
  end

  def no_overlap?(coordinates)
    coordinates.all? do |coordinate|
      if @cells[coordinate] == nil
        false
      else
        @cells[coordinate].empty?
      end
      # @cells[coordinate].empty?
    end
  end

  def return_ordinals(coordinates, index)
    coordinates.map do |coordinate|
      coordinate[index].ord
    end
  end

  def row_ordinal_range(coordinates)
    (return_ordinals(coordinates, 1).min..return_ordinals(coordinates, 1).max).to_a
  end

  def column_ordinal_range(coordinates)
    (return_ordinals(coordinates, 0).min..return_ordinals(coordinates, 0).max).to_a
  end

  def not_diagonal?(coordinates)
  # If columns all the same ordinal value, then row ordinal values must be different (equal to the coordinate length) and vice-versa
    row_ordinal_range(coordinates).length == 1 && column_ordinal_range(coordinates).length == coordinates.length || row_ordinal_range(coordinates).length == coordinates.length && column_ordinal_range(coordinates).length == 1
  end

  def valid_placement?(ship_type, coordinates)
    no_overlap?(coordinates) && consecutive_columns_or_rows?(coordinates) && ship_type.length == coordinates.length && not_diagonal?(coordinates)
  end

  def place(ship_type, coordinates)
    if valid_placement?(ship_type, coordinates) == true
      coordinates.map do |coordinate|
        @cells[coordinate].place_ship(ship_type)
      end
    end
  end

  def rendered_cells(ship_display = false)
    rend_cells = []

    @cells.each do |coordinate, cell_instance|
      if ship_display
        rend_cells << "#{cell_instance.render(true)} "
      else
        rend_cells << "#{cell_instance.render} "
      end
    end
    rend_cells
  end

  def cells_per_row
    (rendered_cells.length / generate_rows.length).to_i
  end

  def render_rows_and_cells(ship_display = false)
    index = 0
    rows_and_cells = ""
    generate_rows.each do |row|
      rows_and_cells << "#{row} #{rendered_cells(ship_display)[index..(index + cells_per_row - 1)].join("")}\n"
      index += cells_per_row
    end
    rows_and_cells
  end

  def render(ship_display = false)
    "  #{generate_columns.join(" ")} \n" +
    render_rows_and_cells(ship_display)
  end

end
