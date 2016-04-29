defmodule Yahtzee do

  def upper(rolls, score_value) do
    Enum.filter(rolls, fn x -> x == score_value end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  def ones(rolls), do: upper(rolls, 1)
  def twos(rolls), do: upper(rolls, 2)
  def threes(rolls), do: upper(rolls, 3)
  def fours(rolls), do: upper(rolls, 4)
  def fives(rolls), do: upper(rolls, 5)
  def sixes(rolls), do: upper(rolls, 6)

  def pairs(rolls) do
    rolls
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn({_, v}) -> length(v) > 1 end)
      |> Enum.map(fn({_, [v|_]}) -> v * 2 end)
      |> max_roll
  end

  def three_of_a_kind(rolls) do
    rolls
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn({_, v}) -> length(v) > 2 end)
      |> Enum.map(fn({_, [v|_]}) -> v * 3 end)
      |> max_roll
  end

  def four_of_a_kind(rolls) do
    rolls
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn({_, v}) -> length(v) > 3 end)
      |> Enum.map(fn({_, [v|_]}) -> v * 4 end)
      |> max_roll
  end

  def yahtzee(rolls) do
    rolls
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn({_, v}) -> length(v) > 4 end)
      |> Enum.map(fn({_, [v|_]}) -> v * 5 end)
      |> max_roll
  end

  def two_pairs(rolls) do
    rolls
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn({_, v}) -> length(v) > 1 end)
      |> (fn(x) -> if Enum.count(x) > 1, do: x, else: [] end).()
      |> Enum.map(fn({_, [v|_]}) -> v * 3 end)
      |> max_roll
  end

  def full_house(rolls) do
    grouped_rolls = Enum.group_by(rolls, &(&1))
    cond do
      Enum.count(grouped_rolls) == 1 -> 0
      Enum.any?(grouped_rolls, fn({_, v}) -> length(v) == 1 end) -> 0
      true -> Enum.sum(rolls)
    end

  end

  def chance(rolls) do
    rolls
    |> Enum.sum
  end

  def max_roll([]), do: 0
  def max_roll(rolls), do: Enum.max(rolls)

end
