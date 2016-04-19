require 'test/unit'
require_relative 'quality_factory_contract'
require_relative '../../quality/quality_calculator_factory'
require_relative '../../quality/quality_calculator'
require_relative '../../quality/sulfuras_quality_calculator'
require_relative '../../quality/brie_quality_calculator'
require_relative '../../quality/concert_quality_calculator'
require_relative '../../quality/conjured_quality_calculator'

class TestQualityCalculatorFactory < Test::Unit::TestCase
  include QualityCalculatorFactoryContract
  
  class FakeItem
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end

  def setup
    @subject = QualityCalculatorFactory
  end

  def validate_calculator(name, expected_calculator)
    assert_equal(expected_calculator, @subject.for_item(FakeItem.new(name)).class)
  end

  def test_quality_factory_contract
    validate_quality_factory_contract(@subject)
  end

  def test_foo
    validate_calculator('foo', QualityCalculator)
  end

  def test_sulfuras
    validate_calculator('Sulfuras, Hand of Ragnaros', SulfurasQualityCalculator)
  end

  def test_brie
    validate_calculator('Aged Brie', BrieQualityCalculator)
  end

  def test_concert
    validate_calculator('Backstage passes to a TAFKAL80ETC concert', ConcertQualityCalculator)
  end

  def test_conjured
    validate_calculator('Conjured Thingamabob', ConjuredQualityCalculator)
  end
end
