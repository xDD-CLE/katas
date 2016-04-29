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

  # four_of_a_kind tests

  test "four_of_a_kind returns 0 when no four of a kind exists" do
    assert four_of_a_kind([1,2,3,4,5]) == 0
  end

  test "four_of_a_kind returns sum of four when possible" do
    assert four_of_a_kind([1,1,1,1,4]) == 4
  end

  test "four_of_a_kind doesn't overcount for yahtzee" do
    assert four_of_a_kind([2,2,2,2,2]) == 8
  end

  # yahtzee tests

  test "yahtzee returns 0 when no yahtzee exists" do
    assert yahtzee([1,2,3,4,5]) == 0
  end

  test "yahtzee returns sum of all when yahtzee conditions met" do
    assert yahtzee([3,3,3,3,3]) == 15
  end

  test "yahtzee doesn't count partial sum when 4 matching dice" do
    assert yahtzee([1,1,1,1,2]) == 0
  end

  # full house tests

  test "full_house returns 0 when no full house exists" do
    assert full_house([1,1,2,2,3]) == 0
  end

  test "full_house returns correctly when full house exists" do
    assert full_house([2,2,3,3,3]) == 13
  end

  test "full house does not return sum for five of a kind" do
    assert full_house([5,5,5,5,5]) == 0
  end

  # small straight tests

  test "small_straight returns 0 when no straight exists" do
    assert small_straight([1,2,4,5,6]) == 0
  end

  test "small_straight returns 15 for correct straight" do
    assert small_straight([1,2,3,4,5]) == 15
  end

  test "small straight is 0 for large straight" do
    assert small_straight([2,5,4,3,6]) == 0
  end

  # chance tests
  test "chance sums all dice" do
    assert chance([1,2,3,4,5]) == 15
  end

end
