require_relative 'sell_in_calculator'
require_relative 'sulfuras_sell_in_calculator'

class SellInCalculatorFactory
  def self.for_item(item)
    case item.name
    when /sulfuras/i
      SulfurasSellInCalculator.new
    else
      SellInCalculator.new
    end
  end
end
