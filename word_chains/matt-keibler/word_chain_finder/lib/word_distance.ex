defmodule WordDistance do

	def neighbors?(left, right) do
		if String.length(left) == String.length(right) do
			num_diff_chars =
				Enum.zip(String.to_char_list(left), String.to_char_list(right))
			  |> Enum.map(fn({x,y} -> 0 != (y - x)) end)
			  |> Enum.reduce(0, fn(x, acc) -> if x do acc + 1 else acc end end)
			1 == num_diff_chars
		else
			false
		end
	end
end
