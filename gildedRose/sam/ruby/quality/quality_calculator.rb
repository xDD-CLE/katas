class QualityCalculator
  def calculate_quality(item)
    item.quality - quality_delta(item)
  end

  private
  def quality_delta(item)
    if item.sell_in > 0
      1
    else
      2
    end
  end
end
