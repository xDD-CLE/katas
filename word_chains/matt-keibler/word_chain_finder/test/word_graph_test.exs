defmodule WordGraphTest do
	use ExUnit.Case
	doctest WordGraph

	test "A new graph should be empty" do
		assert WordGraph.new.graph |> Enum.count == 0
	end

	test "A graph should be able to add words" do
		word_graph = WordGraph.new |> WordGraph.add_word("word")
		assert WordGraph.get_words(word_graph, "word") == %HashSet{}
	end

	test "A graph should have associations between neighboring words" do
		word_graph = WordGraph.new |> WordGraph.add_word("cat") |> WordGraph.add_word("cot")
		assert WordGraph.get_words(word_graph, "cat") == Set.put(HashSet.new, "cot")
		assert WordGraph.get_words(word_graph, "cot") == Set.put(HashSet.new, "cat")
	end

	test "A graph should not have associations between words that are not neighbors" do
		word_graph = WordGraph.new |> WordGraph.add_word("cat") |> WordGraph.add_word("dog")
		assert WordGraph.get_words(word_graph, "cat") == %HashSet{}
		assert WordGraph.get_words(word_graph, "dog") == %HashSet{}
	end

	test "A graph should be able to have multiple words associated to a word" do
		word_graph = WordGraph.new
		|> WordGraph.add_word("cat")
		|> WordGraph.add_word("cot")
		|> WordGraph.add_word("car")
		assert WordGraph.get_words(word_graph, "cat") == Enum.into(["cot", "car"], HashSet.new)
	end

	test "A graph should only contain a word once" do
		word_graph = WordGraph.new
		|> WordGraph.add_word("cat")
		|> WordGraph.add_word("cot")
		|> WordGraph.add_word("cot")
		assert WordGraph.get_words(word_graph, "cat") == Set.put(HashSet.new, "cot")
	end

	test "A graph should be collectable" do
		word_list = ["cat", "cot", "car"]
		word_graph = Enum.into(word_list, WordGraph.new)
		assert WordGraph.get_words(word_graph, "cat") == Enum.into(["cot", "car"], HashSet.new)
	end
end
