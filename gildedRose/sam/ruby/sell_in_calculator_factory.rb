require_relative 'sell_in_calculator'

class SellInCalculatorFactory
  def self.for_name(name)
    SellInCalculator.new
  end
end
