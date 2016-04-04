defmodule Katayahtzee do

  @moduledoc

  def placement(dice_roll, placement) do
    dice_roll
    |> Enum.filter(&(&1 == placement))
    |> Enum.sum
  end

  def two_pairs(dice_roll) do




  end

  def pair(dice_roll) do
    dice_roll 
    |> value_in_list_to_count 
    |> sum_of_the_highest_count_value(2)
    |> Enum.max
  end

  defp value_in_list_to_count(numbers) do
    increment_count = &(&1 +1)
    numbers 
    |> 
    Enum.reduce(%{}, fn(number, map) -> Map.update(map, number, 1, increment_count) end)
  end

  defp sum_of_the_highest_count_value(value_to_count, filter_count) do
    value_to_count
    |> Enum.filter_map(fn({_,v}) -> v == filter_count end, fn({k,_}) -> k*filter_count end)
  end
end
