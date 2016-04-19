require 'test/unit'
require_relative '../../sell_in/sell_in_calculator_factory'
require_relative '../../sell_in/sulfuras_sell_in_calculator'
require_relative 'sell_in_factory_contract'

class TestSellInFactory < Test::Unit::TestCase
  include SellInCalculatorFactoryContract

  class FakeItem
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end


  def setup
    @subject = SellInCalculatorFactory
  end

  def test_sell_in_factory_contract
    validate_sell_in_factory_contract(@subject)
  end

  def test_foo
    item = FakeItem.new('foo')
    assert_equal(SellInCalculator, @subject.for_item(item).class)
  end

  def test_sulfuras
    item = FakeItem.new('Sulfuras, Hand of Ragnaros')
    assert_equal(SulfurasSellInCalculator, @subject.for_item(item).class)
  end
end
