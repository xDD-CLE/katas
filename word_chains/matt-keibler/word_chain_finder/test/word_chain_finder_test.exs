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
	
end
