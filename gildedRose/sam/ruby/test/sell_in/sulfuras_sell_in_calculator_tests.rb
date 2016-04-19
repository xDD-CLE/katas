require 'test/unit'
require 'sell_in/sulfuras_sell_in_calculator'
require_relative 'sell_in_calculator_contract'

class TestSulfurasSellInCalculator < Test::Unit::TestCase
  include SellInCalculatorContract


  class FakeItem
    attr_accessor :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in = sell_in
      @quality = quality
    end
  end

  def setup
    @subject = SulfurasSellInCalculator.new
  end

  def test_sell_in_calculator_contract
    validate_sell_in_calculator_contract(@subject)
  end

  def test_calculate_sell_in
    item = FakeItem.new(sell_in: 10, quality: 5)
    assert_equal(10, @subject.calculate_sell_in(item))
  end
end
