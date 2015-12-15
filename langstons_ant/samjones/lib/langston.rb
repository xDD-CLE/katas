require 'ant'
require 'cell'
require 'grid_printer'
require 'curses_printer'
require 'color_behavior'

class Langston
	include ColorBehavior

	def initialize(x_size, y_size, printer = GridPrinter)
		create_printer(x_size, y_size, printer)
		create_cells(x_size, y_size)
		create_ant(x_size, y_size)
		@ant = Ant.new((x_size/2.0).round-1, (y_size/2.0).round-1, facing: :north, printer: @printer).print
		@printer.refresh
	end

	def run(generations)
		generations.times do
			cell_under_ant = find_cell_under_ant
			turn = turn_for_color(cell_under_ant.color)

			update_cell_color(cell_under_ant)
			@ant.turn!(turn).move!.print
			@printer.refresh
		end
	end



	private
		def create_cells(x_size, y_size)
			@cells = [].tap do |cells|
				x_size.times do |x|
					y_size.times do |y|
						cell = Cell.at_with_color(x, y, :black)
						@printer.print(x, y, cell.color)
						cells << cell
					end
				end
			end
		end

		def create_printer(x_size, y_size, printer)
			@printer = printer.open_with_size(x_size, y_size)
			#@printer = GridPrinter.open_with_size(x_size, y_size)
		end

		def create_ant(x_size, y_size)
		end

		def find_cell_under_ant
			@cells.find do |cell|
				cell.x == @ant.x && cell.y == @ant.y
			end
		end

		def	update_cell_color(cell_under_ant)
			cell_under_ant.color = next_color(cell_under_ant.color)
			@printer.print(cell_under_ant.x, cell_under_ant.y, cell_under_ant.color)
		end
end
