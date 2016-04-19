require 'test/unit'
require 'quality/brie_quality_calculator'
require_relative 'quality_calculator_contract'

class TestBrieQualityCalculator < Test::Unit::TestCase
  include QualityCalculatorContract

  class FakeItem
    attr_accessor :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in = sell_in
      @quality = quality
    end
  end

  def setup
    @subject = BrieQualityCalculator.new
  end

  def test_quality_calculator_contract
    validate_quality_calculator_contract(@subject)
  end

  def test_calculate_quality_before_sell_in
    item = FakeItem.new(sell_in: 5, quality: 10)
    assert_equal(11, @subject.calculate_quality(item))
  end

  def test_calculate_quality_after_sell_in
    item = FakeItem.new(sell_in: 0, quality: 10)
    assert_equal(12, @subject.calculate_quality(item))
  end
end
