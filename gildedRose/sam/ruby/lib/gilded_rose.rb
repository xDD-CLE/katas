class GildedRose
  def update_quality(items)
    items.map(&:update_quality)
  end
end
