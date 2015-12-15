require 'ant'
require 'cell'
require 'grid_printer'
require 'curses_printer'
require 'color_behavior'

class Langston
	def initialize(printer)
		@printer = printer
		create_cells
		@ant = Ant.new((printer.width/2.0).round-1, (printer.height/2.0).round-1, facing: :north, printer: @printer).print
		@printer.refresh
	end

	def run(generations)
		generations.times do
			cell_under_ant = find_cell_under_ant
			next_turn = cell_under_ant.current_color[:turn]

			cell_under_ant.recolor.print
			@ant.turn!(next_turn).move!.print
			@printer.refresh
		end
	end



	private
		def create_cells
			@cells = [].tap do |cells|
				@printer.width.times do |x|
					@printer.height.times do |y|
						cells << Cell.new(x, y, :black, printer: @printer).print
					end
				end
			end
		end

		def find_cell_under_ant
			@cells.find do |cell|
				cell.x == @ant.x && cell.y == @ant.y
			end
		end
end
