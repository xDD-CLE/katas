defmodule KatayahtzeeTest do
  use ExUnit.Case
  doctest Katayahtzee

  test "placement" do
    outcome = %Katayahtzee{roll: [1, 1, 2, 4, 4], placement: 4}
    assert Katayahtzee.calculate(outcome) == 8
  end

  test "pair" do
    assert  Katayahtzee.pair([3, 3, 1, 1, 5]) == 6
  end

  test "two pairs" do
    assert  Katayahtzee.two_pairs([1, 1, 2, 3, 3]) == 8
  end

  test "three of a kind" do
    assert  Katayahtzee.three_of_a_kind([1, 1, 3, 3, 3]) == 9
  end
end
