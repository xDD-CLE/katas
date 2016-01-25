defmodule WordGraphBuilderTest do
	use ExUnit.Case
	doctest WordGraphBuilder

	test "It should return an error message if there is no file" do
		{:error, "File does not exist"} = WordGraphBuilder.build_graph("test_files/not_a_real_file.txt")
	end

  test "It should return an error when the file doesn't contain a word list" do
		{:error, "File did not contain a word list."} = WordGraphBuilder.build_graph("test_files/empty_file.txt")
	end

	test "It should return a graph when the file contains a word list" do
		expected = {:ok, %{"cat" => ["cot"], "cot" => ["cat", "cog"], "cog" => ["cot", "dog"], "dog" => ["cog"]}}

		assert expected == WordGraphBuilder.build_graph("test_files/simple_list.txt")
	end
end
