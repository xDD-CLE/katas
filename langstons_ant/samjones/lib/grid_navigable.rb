module GridNavigable
	attr_accessor :x, :y

	def at(x, y)
		self.x=x
		self.y=y
		self
	end

	def move_direction!(direction)
		public_send(direction)
	end
	def north
		self.y = y-1
	end
	def south
		self.y = y+1
	end
	def east
		self.x = x+1
	end
	def west
		self.x = x-1
	end

end
