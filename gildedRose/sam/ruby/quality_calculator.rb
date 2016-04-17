class QualityCalculator
  def calculate_quality(item)
    item.quality - quality_delta(item)
  end

  private
  def quality_delta(item)
    case item.sell_in
    when 0..
      1
    else
      2
    end
  end
end
