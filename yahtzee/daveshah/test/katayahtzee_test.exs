defmodule KatayahtzeeTest do
  use ExUnit.Case
  doctest Katayahtzee

  test "placement calculation" do
    dice_roll = [1, 1, 2, 4, 4]
    placement = 4

    assert Katayahtzee.placement(dice_roll, placement) == 8

  end

  test "pair calculation" do
    dice_roll = [3, 3, 1, 1, 5]

    assert  Katayahtzee.pair(dice_roll) == 6
  end

  test "two pairs calculation" do
    dice_roll = [1, 1, 2, 3, 3]

    assert  Katayahtzee.two_pairs(dice_roll) == 8
  end

  # TODO: work on refactor pass play around with what the structure might look like if generifying it

end
