require 'grid_navigable'

class Ant
	include GridNavigable
	@@directions = [
		:north,
		:east,
		:south,
		:west
	]

	@@turn_direction = {
		left: -1,
		right: +1
	}

	def initialize(x, y, opts = {})
		at(x, y)
		@facing = opts[:facing] || :north
		@printer = opts[:printer] || :printer
	end

	def turn!(turn)
			increment = @@turn_direction[turn]
			current_pos = @@directions.find_index(@facing)
			@facing = @@directions[(current_pos + increment) % @@directions.size]
		self
	end

	def move!
		move_direction!(@facing)
		self
	end

	def print
		@printer.print(x, y, @facing) if @printer
		self
	end
end
