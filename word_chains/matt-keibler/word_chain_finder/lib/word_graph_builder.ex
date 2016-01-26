defmodule WordGraphBuilder do

	def build_graph(filename) do
		if File.exists? filename do
			{:ok, file_content} = File.read(filename)
			parse_content_to_list(file_content)
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
end
