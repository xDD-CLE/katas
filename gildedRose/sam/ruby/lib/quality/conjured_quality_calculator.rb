class ConjuredQualityCalculator
  def calculate_quality(item)
    item.quality - calculate_delta(item)
  end

  private
  def calculate_delta(item)
    if item.sell_in > 0
      2
    else
      4
    end
  end
end
