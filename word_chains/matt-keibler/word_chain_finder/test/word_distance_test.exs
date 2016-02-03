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
		assert !WordDistance.neighbors?("cat", "catch")
	end
end
