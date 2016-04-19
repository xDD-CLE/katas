require 'item'
require_relative 'item_contract'
require_relative 'quality/quality_factory_contract'
require_relative 'quality/quality_calculator_contract'
require_relative 'sell_in/sell_in_factory_contract'
require_relative 'sell_in/sell_in_calculator_contract'
require 'test/unit'

class TestItem < Test::Unit::TestCase
  include ItemContract
  include QualityCalculatorFactoryContract
  include QualityCalculatorContract
  include SellInCalculatorFactoryContract
  include SellInCalculatorContract
  
  NEW_QUALITY = 88
  class FakeQualityCalculator
    def calculate_quality(item)
      NEW_QUALITY
    end
  end
  class FakeQualityCalculatorFactory
    def self.for_item(item)
      FakeQualityCalculator.new
    end
  end

  NEW_SELL_IN = 42
  class FakeSellInCalculator
    def calculate_sell_in(item)
      NEW_SELL_IN
    end
  end
  class FakeSellInCalculatorFactory
    def self.for_item(item)
      FakeSellInCalculator.new
    end
  end

  NAME = 'foo'
  SELL_IN = 10
  QUALITY = 20

  def setup
    @subject = Item.new(name: NAME, 
                        sell_in: SELL_IN, 
                        quality: QUALITY, 
                        quality_calculator_factory: FakeQualityCalculatorFactory,
                        sell_in_calculator_factory: FakeSellInCalculatorFactory)
  end


  def test_item_values
    assert_equal(NAME, @subject.name)
    assert_equal(SELL_IN, @subject.sell_in)
    assert_equal(QUALITY, @subject.quality)
  end

  def test_item_update_quality
    new_item = @subject.update_quality

    assert_equal(NEW_QUALITY, new_item.quality)
    assert_equal(NEW_SELL_IN, new_item.sell_in)

    assert_equal(QUALITY, @subject.quality)
    assert_equal(SELL_IN, @subject.sell_in)
  end

  def test_item_contract
    validate_item_contract(@subject)
  end

  def test_fake_quality_factory_contract
    validate_quality_factory_contract(FakeQualityCalculatorFactory)
  end

  def test_fake_quality_calculator_contract
    validate_quality_calculator_contract(FakeQualityCalculator.new)
  end

  def test_fake_sell_in_factory_contract
    validate_sell_in_factory_contract(FakeSellInCalculatorFactory)
  end

  def test_fake_sell_in_calculator_contract
    validate_sell_in_calculator_contract(FakeSellInCalculator.new)
  end
end
