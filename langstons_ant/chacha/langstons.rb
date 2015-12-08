class Grid

	def get_height
		11
	end

	def get_width
		11	
	end

	def get_colour(x,y)
		"white" 
	end

	def toggle(x,y)
		orig_colour = get_colour(x,y)
		if orig_colour == "white"
			"black"
		else
			"white"
		end

	end


end