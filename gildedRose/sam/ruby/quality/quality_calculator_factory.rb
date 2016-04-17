require_relative 'quality_calculator'
require_relative 'sulfuras_quality_calculator'
require_relative 'brie_quality_calculator'
require_relative 'concert_quality_calculator'
require_relative 'conjured_quality_calculator'

class QualityCalculatorFactory
  def self.for_item(item)
    case item.name
    when /sulfuras/i
      SulfurasQualityCalculator.new
    when /aged brie/i
      BrieQualityCalculator.new
    when /concert.*/i
      ConcertQualityCalculator.new
    when /conjured.*/i
      ConjuredQualityCalculator.new
    else
      QualityCalculator.new
    end
  end
end
