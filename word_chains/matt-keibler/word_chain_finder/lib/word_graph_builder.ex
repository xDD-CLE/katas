defmodule WordGraphBuilder do

	def build_graph(filename) do
		if File.exists? filename do
			{:ok, file_content} = File.read(filename)
			content_list = parse_content_to_list(file_content)
			case content_list do
				{:ok, word_list} -> parse_word_list_to_graph(word_list)
				_ -> content_list
			end
		else
			{:error, "File does not exist"}
		end
	end

	defp parse_content_to_list(file_content) do
		word_list = file_content |> String.split("\n") |> Enum.filter(&(String.length(&1) > 0))
		if Enum.count(word_list) > 0 do
			{:ok, word_list}
		else
			{:error, "File did not contain a word list."}
		end
	end

	defp parse_word_list_to_graph(word_list) do
		parse_graph_helper(word_list, %{})
	end

	defp parse_graph_helper([], graph) do {:ok, graph} end

	defp parse_graph_helper([word | word_list], graph) do
		# get word list length map
		word_length = String.length(word)
		n_char_map = Map.get(graph, word_length, %{})
		associations_for_word = Map.get(n_char_map, word, [])
		filtered_list = word_list |> Enum.filter(&(WordDistance.neighbors?(word, &1)))

		associations_for_word = associations_for_word ++ filtered_list
		n_char_map = Map.put(n_char_map, word, associations_for_word)

		n_char_map = filtered_list |> Enum.reduce(n_char_map, fn(x, acc) -> Map.put(acc, x, [word] ++ Map.get(acc, x, [])) end)
		
		graph = Map.put(graph, word_length, n_char_map)
		parse_graph_helper(word_list, graph)
	end
end
