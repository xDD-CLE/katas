require_relative 'quality/quality_calculator_factory'
require_relative 'sell_in/sell_in_calculator_factory'

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name:, sell_in:, quality:)
    @name = name
    @sell_in = sell_in
    @quality = quality

    @quality_calculator = QualityCalculatorFactory.for_item(self)
    @sell_in_calculator = SellInCalculatorFactory.for_item(self)
  end

  def update_quality
    Item.new(name: @name, 
             quality: @quality_calculator.calculate_quality(self), 
             sell_in: @sell_in_calculator.calculate_sell_in(self))
  end
end
