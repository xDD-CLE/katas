require 'colorize'

class GridPrinter
	def initialize(width, height)
		@width = width
		@height = height
		@grid = Array.new(height) {Array.new(width)}
	end
	def self.open_with_size(width, height)
		GridPrinter.new(width, height)
	end

	def print(x, y, value)
		@grid[y][x] = value
	end

	def refresh
		sleep(0.1)

		@height.times do |y|
			line = ""
			@width.times do |x|
				line << get_character_at(x, y)
			end
			puts line + "\n"
		end

		puts
		puts
	end

	def width
		@width
	end

	def height
		@height
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
