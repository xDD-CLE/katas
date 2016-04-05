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
      |> Enum.group_by(fn(x) -> x end)
      |> Enum.filter(fn({_, v}) -> length(v) > 1 end)
      |> Enum.map(fn({_, [v|_]}) -> v * 2 end)
      |> max_roll
  end

  def three_of_a_kind(rolls) do
    rolls
      |> Enum.group_by(fn(x) -> x end)
      |> Enum.filter(fn({_, v}) -> length(v) > 2 end)
      |> Enum.map(fn({_, [v|_]}) -> v * 3 end)
      |> max_roll
  end

  def max_roll([]), do: 0
  def max_roll(rolls), do: Enum.max(rolls)

  def two_pairs(rolls) do
    rolls = Enum.sort(rolls) |> Enum.reverse
    Enum.reduce(Enum.uniq(rolls), 0,
      fn x, acc ->
        if match_exists(rolls, x, 2),
        do: acc + match_sum(rolls, x, 2),
        else: acc
      end
    )
  end

  def match_sum(rolls, match_num, counts) do
    if match_exists(rolls, match_num, counts) do
      match_num * counts
    else
      0
    end
  end

  def match_exists(rolls, match_num, counts) do
    Enum.count(rolls, fn n -> n == match_num end) >= counts
  end

end
