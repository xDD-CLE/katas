defmodule WordChainFinder do

	def run() do
		graph = get_graph(&IO.gets/2, &WordGraphBuilder.build_graph/1)
		words = get_input(&IO.gets/2)
		path = get_path(&AStar.search/2, graph, words)
		print_path(&IO.puts/2, path)
	end

	def get_input(input_function) do
		start_word = input_function.("Enter the start word: ")
		end_word = input_function.("Enter the end word: ")
		{start_word, end_word}
	end

	def get_graph(input_function, graph_function) do
		graph_filename = input_function.("Enter the word list filename: ")
		graph_function.(graph_filename)
	end

	def get_path(search_function, graph, words) do
		search_function.(graph, words)
	end

	def print_path(output_function, path) do
		path |> Enum.reduce(fn(token, acc) -> acc <> " -> " <> token end) |> output_function.()
	end
end
