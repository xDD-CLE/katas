defmodule WordGraphBuilder do

	def build_graph(filename) do
		if File.exists? filename do
			{:ok, file_content} = File.read(filename)
			content_list = parse_content_to_list(file_content)
			case content_list do
				{:ok, word_list} -> {:ok, WordGraph.new(word_list)}
				_ -> content_list
			end
		else
			{:error, "File does not exist"}
		end
	end

	defp parse_content_to_list(file_content) do
		word_list = file_content |> String.split("\n") |> clean_list
		if Enum.count(word_list) > 0 do
			{:ok, word_list}
		else
			{:error, "File did not contain a word list."}
		end
	end

	defp clean_list(word_list) do
		word_list |> Stream.filter(&(String.length(&1) > 0))
		|> Stream.filter(&(String.match?(&1, ~r/^[a-zA-Z]*$/)))
		|> Enum.map(&(String.downcase(&1)))
	end
end
