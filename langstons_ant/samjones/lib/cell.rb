require 'grid_navigable'
require 'color_behavior'

class Cell
	include GridNavigable
	include ColorBehavior

	def initialize(x, y, color, opts = {})
		at(x, y)
		@color = color
		@printer = opts[:printer]
		self
	end

	def recolor
		@color = next_color(@color)
		self
	end

	def current_color
		color_info(@color)
	end

	def print
		@printer.print(x, y, @color) if @printer
		self
	end
end
