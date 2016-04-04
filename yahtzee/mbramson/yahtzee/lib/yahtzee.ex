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
    rolls = Enum.sort(rolls)
    rolls = Enum.reverse(rolls)
    rolls_unique = Enum.uniq(rolls)
    Enum.reduce_while(rolls_unique, 0,
      fn x, acc ->
        if match_exists(rolls, x, 2),
        do: {:halt, acc + match_sum(rolls, x, 2)},
        else: {:cont, acc}
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
