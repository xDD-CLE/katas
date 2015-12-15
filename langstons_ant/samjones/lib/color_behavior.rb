module ColorBehavior
	@@colors = {
		black: {
			next_color: :white,
			turn: :right
		},
		white: {
			next_color: :green,
			turn: :left
		},
		green: {
			next_color: :blue,
			turn: :left
		},
		blue: {
			next_color: :black,
			turn: :right
		}
	}

	def next_color(color)
		@@colors[color][:next_color]
	end

	def turn_for_color(color)
		@@colors[color][:turn]
	end
end
