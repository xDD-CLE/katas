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

	defp parse_graph_helper([], graph) do graph end

	defp parse_graph_helper([word | word_list], graph) do
		# TODO
		parse_graph_helper(word_list, graph)
	end
end
