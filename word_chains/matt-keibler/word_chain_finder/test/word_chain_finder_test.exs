defmodule WordChainFinderTest do
  use ExUnit.Case
  doctest WordChainFinder

	test "it should accept two words as input" do
		input_function = fn
			text when text == "Enter the start word: " -> "cat"
		  text -> "dog"
		end
		
		{"cat", "dog"} == WordChainFinder.get_input(input_function)
	end

	test "it should accept a graph filename" do
		input_function = fn text -> "graph_file" end
		graph_function = fn text -> {:ok, %{"cat" => ["cot"]}} end

		{:ok, %{"cat" => ["cot"]}} = WordChainFinder.get_graph(input_function, graph_function)
	end

	test "it should get a path from the search" do
		search_function = fn
			graph, words when graph == %{"cat" => "cot"} and words == {"cat", "dog"} -> ["cat", "cot", "dog"]
		end
		graph = %{"cat" => "cot"}
		words = {"cat", "dog"}
		
		
		["cat", "cot", "dog"] = WordChainFinder.get_path(search_function, graph, words)
	end

	test "it should print the returned path" do
		output_function = fn
			path when path == "cat -> cot -> dog" -> :ok
		  _ -> :error
		end
		path = ["cat", "cot", "dog"]

		:ok = WordChainFinder.print_path(output_function, path)
	end
	
end
