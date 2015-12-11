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

	attr_accessor :facing

	def self.at_and_facing(x, y, facing)
		ant = Ant.new
		ant.at(x, y)
		ant.facing = facing
		ant
	end

	def turn_and_move(turn)
		turn(turn)
		move!(facing)
	end

	private
	def turn(turn)
		increment = @@turn_direction[turn]
		current_pos = @@directions.find_index(facing)
		self.facing = @@directions[(current_pos + increment) % @@directions.size]
	end
end
