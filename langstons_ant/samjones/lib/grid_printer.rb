require 'colorize'

class GridPrinter
	def initialize(x_size, y_size)
		@x_size = x_size
		@y_size = y_size
		@grid = Array.new(y_size) {Array.new(x_size)}
	end
	def self.open_with_size(x_size, y_size)
		GridPrinter.new(x_size, y_size)
	end

	def print(x, y, value)
		@grid[y][x] = value
	end

	def refresh
		sleep(0.1)

		@y_size.times do |y|
			line = ""
			@x_size.times do |x|
				line << get_character_at(x, y)
			end
			puts line + "\n"
		end

		puts
		puts
	end

	private
		def get_character_at(x, y)
			case @grid[y][x]
			when :north
				"\u2191".colorize(color: :red, background: @grid[y][x])
			when :south
				"\u2193".colorize(color: :red, background: @grid[y][x])
			when :east
				"\u2192".colorize(color: :red, background: @grid[y][x])
			when :west
				"\u2190".colorize(color: :red, background: @grid[y][x])
			else
				" ".colorize(background: @grid[y][x])
			end
		end
end
