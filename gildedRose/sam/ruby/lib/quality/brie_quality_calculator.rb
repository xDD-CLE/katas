class BrieQualityCalculator
  def calculate_quality(item)
    if item.quality < 50
      item.quality + calculate_delta(item)
    else
      item.quality
    end
  end

  private
  def calculate_delta(item)
    if item.sell_in > 0
      1
    else
      2
    end
  end
end
