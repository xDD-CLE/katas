defmodule Yahtzee do
  
  @categories [:pairs, 
               :three_of_a_kind,
               :four_of_a_kind,
               :yahtzee,
               :two_pairs,
               :full_house,
               :small_straight,
               :large_straight
              ]


  def best_category(rolls) do
    @categories
    |> Enum.map(&({&1, apply(Yahtzee, &1, [rolls] ) } ) )
    |> Enum.max_by(fn {_k, v} -> v end)
  end

  def ones(rolls), do: upper(rolls, 1)
  def twos(rolls), do: upper(rolls, 2)
  def threes(rolls), do: upper(rolls, 3)
  def fours(rolls), do: upper(rolls, 4)
  def fives(rolls), do: upper(rolls, 5)
  def sixes(rolls), do: upper(rolls, 6)

  def upper(rolls, score_value) do
    Enum.filter(rolls, fn x -> x == score_value end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  def pairs(rolls), do: n_of_a_kind(2).(rolls)
  def three_of_a_kind(rolls), do: n_of_a_kind(3).(rolls)
  def four_of_a_kind(rolls), do: n_of_a_kind(4).(rolls)
  def yahtzee(rolls), do: n_of_a_kind(5).(rolls)

  defp n_of_a_kind(n) do
    fn(rolls) ->
      rolls
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn({_k, v}) -> length(v) > n - 1 end)
      |> Enum.map(fn({_k, [v|_v]}) -> v * n end)
      |> max_roll
    end
  end

  def two_pairs(rolls) do
    rolls
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn({_k, v}) -> length(v) > 1 end)
    |> (fn(x) -> if Enum.count(x) > 1, do: x, else: [] end).()
    |> Enum.map(fn({_k, [v|_v]}) -> v * 3 end)
    |> max_roll
  end

  def full_house(rolls) do
    grouped_rolls = Enum.group_by(rolls, &(&1))
    cond do
      Enum.count(grouped_rolls) == 1 -> 0
      Enum.any?(grouped_rolls, fn({_k, v}) -> length(v) == 1 end) -> 0
      true -> Enum.sum(rolls)
    end
  end

  def small_straight(rolls), do: all_unique_and_no_n_then_sum(6).(rolls)
  def large_straight(rolls), do: all_unique_and_no_n_then_sum(1).(rolls)

  defp all_unique_and_no_n_then_sum(n) do
    fn(rolls) ->
      grouped_rolls = Enum.group_by(rolls, &(&1))
        cond do
          Enum.count(grouped_rolls) != 5 -> 0
          Enum.any?(grouped_rolls, fn({k, _v}) -> k == n end) -> 0
          true -> Enum.sum(rolls)
        end
    end
  end

  def chance(rolls), do: Enum.sum(rolls)

  defp max_roll([]), do: 0
  defp max_roll(rolls), do: Enum.max(rolls)

end
