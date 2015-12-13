module ColorBehavior
	@@colors = {
		black: {
			next_color: :white,
			turn: :right
		},
		white: {
			next_color: :black,
			turn: :left
		}
	}

	def next_color(color)
		@@colors[color][:next_color]
	end

	def turn_for_color(color)
		@@colors[color][:turn]
	end
end
