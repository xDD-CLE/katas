import GildedRose

defmodule GildedRoseTest do
  use ExUnit.Case

  test "item with value of 0 retains 0 quality" do
    assert update_item(%{quality: 0, sell_in: 0}).quality == 0
  end

  test "regular item decreases in quality by 1 if sell_in is > 0" do
    assert update_item(%{quality: 10, sell_in: 5, name: "arbitrary item"}).
                         quality == 9
  end

  test "regular item decreases in quality by 1 if sell_in is 0" do
    assert update_item(%{quality: 10, sell_in: 0, name: "arbitrary item"}).
                         quality == 9
  end

  test "regular item decreases in quality by 1 if sell_in is < 0" do
    assert update_item(%{quality: 10, sell_in: -1, name: "arbitrary item"}).
                         quality == 8
  end

  test "regular item decreases sell_in by 1 if sell_in is > 0" do
    assert update_item(%{quality: 10, sell_in: 8, name: "arbitrary item"}).
                         sell_in == 7
  end

  # back stage pass tests

  #TODO: Implement backstage tests for different concerts

  test "backstage passes expire when sell_in is less than 0" do
    assert update_item(%{quality: 10, sell_in: -1,
                         name: "Backstage passes to a TAFKAL80ETC concert"}).
                         quality == 0
  end

  test "backstage passes increase in quality by 2 when sell_in is 6" do
    assert update_item(%{quality: 10, sell_in: 6,
                         name: "Backstage passes to a TAFKAL80ETC concert"}).
                         quality == 12
  end

  test "backstage passes increase in quality by 2 when sell_in is 10" do
    assert update_item(%{quality: 14, sell_in: 6,
                         name: "Backstage passes to a TAFKAL80ETC concert"}).
                         quality == 16
  end

  test "backstage passes increase in quality by 3 when sell_in is 0" do
    assert update_item(%{quality: 6, sell_in: 0,
                         name: "Backstage passes to a TAFKAL80ETC concert"}).
                         quality == 9
  end

  test "backstage passes increase in quality by 3 when sell_in is 5" do
    assert update_item(%{quality: 8, sell_in: 5,
                         name: "Backstage passes to a TAFKAL80ETC concert"}).
                         quality == 11
  end

  # Aged Brie tests

  test "Aged Brie increases in quality by 1 before its sell date" do
    assert update_item(%{quality: 10, sell_in: 5,
                         name: "Aged Brie"}).
                         quality == 11
  end

  test "Aged Brie increases in quality by 1 after its sell date" do
    assert update_item(%{quality: 19, sell_in: -5,
                         name: "Aged Brie"}).
                         quality == 20
  end

  # sulfuras tests

  test "Sulfuras does not decrease in quality" do
    assert update_item(%{quality: 80, sell_in: 5 ,
                         name: "Sulfuras"}).
                         quality == 80
  end
end
