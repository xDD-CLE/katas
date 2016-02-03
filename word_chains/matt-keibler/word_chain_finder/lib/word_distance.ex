defmodule WordDistance do

	def neighbors?(left_word, right_word) do
		if String.length(left_word) == String.length(right_word) do
			1 == distance(left_word, right_word)
		end
	end

	def distance(left_word, right_word) do
		length_diff(left_word, right_word) + letter_diff(left_word, right_word)
	end

	defp length_diff(left_word, right_word) do
		abs(String.length(left_word) - String.length(right_word))
	end

	defp letter_diff(left_word, right_word) do
		Enum.zip(String.to_char_list(left_word), String.to_char_list(right_word))
		|> Enum.map(&char_diff/1)
  	|> Enum.reduce(0, &different?/2)
	end

	defp char_diff({left_char, right_char}) do 0 != (right_char - left_char) end

	defp different?(true, num_different) do num_different + 1 end
	defp different?(false, num_different) do num_different end
end
