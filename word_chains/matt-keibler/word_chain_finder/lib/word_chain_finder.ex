defmodule WordChainFinder do

	def get_input(input_function) do
		start_word = input_function.("Enter the start word: ")
		end_word = input_function.("Enter the end word: ")
		{start_word, end_word}
	end
	
end
