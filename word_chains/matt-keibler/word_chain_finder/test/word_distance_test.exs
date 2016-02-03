defmodule WordDistanceTest do
	use ExUnit.Case
	doctest WordDistance

	test "Words that have a single letter difference of 1 are neighbors" do
		assert WordDistance.neighbors?("cat", "cot")
	end

	test "Words that have multiple letter differences are not neighbors" do
		assert !WordDistance.neighbors?("cat", "cog")
	end

	test "Words that are different lengths are not neighbors" do
		assert !WordDistance.neighbors?("cat", "cats")
	end

	test "Word distance is the number of different characters at the same index positions" do
		assert 1 == WordDistance.distance("cat", "cot")
	end

	test "A word should have a distance of zero with itself" do
		assert 0 == WordDistance.distance("cat", "cat")
	end

	test "Words of different lengths have distances that include the longer word" do
		assert 1 == WordDistance.distance("cat", "cats")
	end
end
