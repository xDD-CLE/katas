defmodule WordGraphBuilderTest do
	use ExUnit.Case
	doctest WordGraphBuilder

	test "It should return an error message if there is no file" do
		assert {:error, "File does not exist"} == WordGraphBuilder.build_graph("test/test_files/not_a_real_file.txt")
	end

  test "It should return an error when the file doesn't contain a word list" do
		assert {:error, "File did not contain a word list."} == WordGraphBuilder.build_graph("test/test_files/empty_file.txt")
	end

	test "It should return a graph when the file contains a word list" do
		expected = {:ok, %WordGraph{graph: %{"cat" => HashSet.put(HashSet.new, "cot"),
															"cot" => Enum.into(["cat", "cog"], HashSet.new),
															"cog" => Enum.into(["cot", "dog"], HashSet.new),
															"dog" => HashSet.put(HashSet.new, "cog")}}}

		assert expected == WordGraphBuilder.build_graph("test/test_files/simple_list.txt")
	end

	test "It should remove words with non [a-zA-z] characters" do
		assert {:error, "File did not contain a word list."} == WordGraphBuilder.build_graph("test/test_files/nonalpha_list.txt")
	end

	test "It should flatten words to lower case" do
		expected = {:ok, %WordGraph{graph: %{"cat" => HashSet.put(HashSet.new, "cot"),
															"cot" => Enum.into(["cat", "cog"], HashSet.new),
															"cog" => Enum.into(["cot", "dog"], HashSet.new),
															"dog" => HashSet.put(HashSet.new, "cog")}}}

		assert expected == WordGraphBuilder.build_graph("test/test_files/capitalization_list.txt")
	end
end
