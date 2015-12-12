require 'grid_navigable'

class Cell
	include GridNavigable

	attr_accessor :color
	
	def self.at_with_color(x, y, color)
		cell = Cell.new
		cell.at(x, y)
		cell.color = color
		cell
	end
end
