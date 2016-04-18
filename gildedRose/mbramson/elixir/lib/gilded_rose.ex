defmodule GildedRose do

  @doc """
  updates each item sequentially, adjusting sell_in and quality according to the
  type, quality, and sell_in value of the object.
  """
  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  @doc """
  Updates a given item over a day period. Decreases the sell_in value and
  adjusts the item quality based on its type, age and existing quality
  """
  def update_item(item) do
    item
    |> update_item_quality
    |> update_item_sell_in
  end

  defp update_item_quality(item) do
    cond do
      String.contains?(item.name, "Sulfuras") -> %{item | quality: 80}

      String.contains?(item.name, "Backstage passes") ->
        update_backstage_pass_quality(item)

      String.contains?(item.name, "Conjured") ->
        update_conjured_item_quality(item)

      item.name == "Aged Brie" -> enhance_by(item, 1)

      item.sell_in < 0 -> degrade_by(item, 2)

      true -> degrade_by(item, 1)
    end
  end


  defp update_backstage_pass_quality(item) do
    cond do
      item.sell_in < 0 -> %{item | quality: 0}
      item.sell_in <= 5 -> enhance_by(item, 3)
      item.sell_in <= 10 -> enhance_by(item, 2)
      true -> enhance_by(item, 1)
    end
  end

  defp update_conjured_item_quality(item) do
    if item.sell_in < 0 do
      degrade_by(item, 4)
    else
      degrade_by(item, 2)
    end
  end

  defp degrade_by(item, amount) do
    %{item | quality: Enum.max([item.quality - amount, 0]) }
  end

  defp enhance_by(item, amount) do
    %{item | quality: Enum.min([item.quality + amount, 50]) }
  end

  defp update_item_sell_in(item), do: %{item | sell_in: item.sell_in - 1}

end
