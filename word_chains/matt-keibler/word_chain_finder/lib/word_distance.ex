defmodule WordDistance do

	def neighbors?(left_word, right_word) do
		if String.length(left_word) == String.length(right_word) do
			1 == distance(left_word, right_word)
		else
			false
		end
	end

	def distance(left_word, right_word) do
		length_diff = abs(String.length(left_word) - String.length(right_word))
		letter_diff = Enum.zip(String.to_char_list(left_word), String.to_char_list(right_word))
		  |> Enum.map(fn({x,y} -> 0 != (y - x)) end)
  	  |> Enum.reduce(0, fn(x, acc) -> if x do acc + 1 else acc end end)
		length_diff + letter_diff
	end
end
