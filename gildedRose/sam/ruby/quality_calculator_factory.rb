require_relative 'quality_calculator'
require_relative 'sulfuras_quality_calculator'

class QualityCalculatorFactory
  def self.for_item(item)
    case item.name
    when /sulfuras/i
      SulfurasQualityCalculator.new
    else
      QualityCalculator.new
    end
  end
end
