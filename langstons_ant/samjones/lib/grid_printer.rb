require 'pp'

class GridPrinter
	def initialize(x_size, y_size)
		@grid = Array.new(y_size) {Array.new(x_size)}
	end
	def self.open_with_size(x_size, y_size)
		GridPrinter.new(x_size, y_size)
	end

	def print(x, y, value)
		@grid[y][x] = value
	end

	def refresh
		sleep(1)
		pp @grid

		puts
		puts
	end
end
