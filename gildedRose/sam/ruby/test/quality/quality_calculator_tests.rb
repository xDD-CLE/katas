require 'test/unit'
require 'quality/quality_calculator'
require_relative 'quality_calculator_contract'

class TestQualityCalculator < Test::Unit::TestCase
  include QualityCalculatorContract

  class FakeItem
    attr_accessor :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in = sell_in
      @quality = quality
    end
  end

  def setup
    @subject = QualityCalculator.new
  end

  def test_quality_calculator_contract
    validate_quality_calculator_contract(@subject)
  end

  def test_calculate_quality_before_sell_in
    item = FakeItem.new(sell_in: 5, quality: 10)
    assert_equal(9, @subject.calculate_quality(item))
  end

  def test_calculate_quality_after_sell_in
    item = FakeItem.new(sell_in: 0, quality: 10)
    assert_equal(8, @subject.calculate_quality(item))
  end
end
