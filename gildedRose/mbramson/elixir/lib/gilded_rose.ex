defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 3}]

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item) do
    item
    |> update_item_quality
    |> update_item_sell_in
  end

  defp update_item_quality(item) do
    cond do
      String.contains?(item.name, "Sulfuras") -> %{item | quality: 80}

      item.name == "Aged Brie" ->
        %{item | quality: Enum.min([item.quality + 1, 50]) }

      String.contains?(item.name, "Backstage passes") ->
        update_backstage_pass_quality(item)

      item.sell_in < 0 ->
        %{item | quality: Enum.max([item.quality - 2, 0]) }

      true -> %{item | quality: Enum.max([item.quality - 1, 0])}
    end
  end

  defp update_backstage_pass_quality(item) do
    cond do
      item.sell_in < 0 -> %{item | quality: 0}
      item.sell_in >= 0 && item.sell_in <= 5 -> %{item | quality: item.quality + 3}
      item.sell_in > 5 && item.sell_in <= 10 -> %{item | quality: item.quality + 2}
      true -> %{item | quality: Enum.min([item.quality + 1, 50]) }
    end
  end

  defp update_item_sell_in(item), do: %{item | sell_in: item.sell_in - 1}
end
