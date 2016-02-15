defmodule WordGraph do
	defstruct graph: Map.new

	def new(words \\ []) do
		Enum.into(words, %WordGraph{})
	end

	def add_word(%WordGraph{graph: word_graph}, word) do
		word_as_set = Set.put(HashSet.new, word)
		# get neighbors from keys
		neighbors = Map.keys(word_graph)
		|> Enum.filter(&WordDistance.neighbors?(&1, word))
		|> Enum.into(HashSet.new)
		# add word -> neighbor using Map.update
		word_graph = associate_word(word_graph, word, neighbors)
		# add neighbor -> word using Map.update
		word_graph = Enum.reduce(neighbors, word_graph, fn(neighbor, acc) -> associate_word(acc, neighbor, word_as_set) end)
		# Map.update(word_graph.graph
		%WordGraph{graph: word_graph}
	end

	defp associate_word(graph, word, neighbors) do
		Map.update(graph, word, neighbors, fn(words) -> Set.union(words, neighbors) end)
	end

	def get_words(%WordGraph{graph: word_graph}, word) do
		Map.get(word_graph, word, HashSet.new)
	end
end

defimpl Collectable, for: WordGraph do

	def into(original) do
		{original, &collect/2}
	end

	defp collect(word_graph, {:cont, word}) do
		WordGraph.add_word(word_graph, word)
	end

	defp collect(word_graph, :done), do: word_graph
	defp collect(word_graph, :halt), do: :ok
end
