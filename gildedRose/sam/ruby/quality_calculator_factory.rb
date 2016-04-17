require_relative 'quality_calculator'

class QualityCalculatorFactory
  def self.for_name(name)
    QualityCalculator.new
  end
end
