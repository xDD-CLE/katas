import Yahtzee

defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "we can score ones for all ones" do
    assert ones([1,1,1,1,1]) == 5
  end

  test "we can score ones for no ones" do
    assert ones([2,2,3,2,2]) == 0
  end

  test "we can score ones for some ones" do
    assert ones([1,1,2,2,2]) == 2
  end

  test "we can score twos for all twos" do
    assert twos([2,2,2,2,2]) == 10
  end

  test "we can score two for no twos" do
    assert twos([1,1,1,1,1]) == 0
  end

  test "we can score ones for some twos" do
    assert twos([1,1,2,2,2]) == 6
  end

  # pairs tests
  test "pairs returns pair when one exact pair exists" do
    assert pairs([1,1,2,3,4]) == 2
  end

  test "pairs returns 0 when no pair exists" do
    assert pairs([1,2,3,4,5]) == 0
  end

  test "pairs scores the highest pair" do
    assert pairs([1,1,3,3,4]) == 6
  end

  test "pairs does not overscore for three pair" do
    assert pairs([2,2,2,3,4]) == 4
  end

  # two pairs tests
  test "two_pairs returns 0 when only one pair is present" do
    assert two_pairs([4, 4, 5, 6, 3]) == 0
  end

  test "two_pairs scores when two pairs exist" do
    assert two_pairs([1,1,2,2,3]) == 6
  end

  test "two_pairs doesn't over score for full house" do
    assert two_pairs([2,2,4,4,4]) == 12
  end

  # three_of_a_kind tests

  test "three_of_a_kind returns 0 when no three of a kind exists" do
    assert three_of_a_kind([1,1,2,3,4]) == 0
  end

  test "three_of_a_kind scores when three of a kind exists" do
    assert three_of_a_kind([2,2,2,4,5]) == 6
  end

  test "three_of_a_kind doesn't overscore for four of a kind" do
    assert three_of_a_kind([3,3,3,3,5]) == 9
  end

  # match_sum tests

  test "match_sum returns 2 when roll has two ones" do
    assert match_sum([1,1,2,3,4], 1, 2) == 2
  end

  test "match_sum returns 2 when roll has three ones but counts is 2" do
    assert match_sum([1,1,1,2,3], 1, 2) == 2
  end

  # match_exists tests
  test "match_exists returns false for no match of 2" do
    assert !match_exists([1,2,3,4,5], 1, 2)
  end

  test "match_exists returns true for match of 2" do
    assert match_exists([1,1,2,3,4], 1, 2)
  end

  test "match_exists returns true for match of 2 when 3 present" do
    assert match_exists([3,3,3,4,5], 3, 2)
  end


end
