class ConcertQualityCalculator
  def calculate_quality(item)
    if item.quality < 50
      item.quality + calculate_delta(item)
    else
      item.quality
    end
  end

  private
  def calculate_delta(item)
    if item.sell_in > 10
      1
    elsif item.sell_in > 5
      2
    elsif item.sell_in > 0
      3
    else
      -item.quality
    end
  end
end
