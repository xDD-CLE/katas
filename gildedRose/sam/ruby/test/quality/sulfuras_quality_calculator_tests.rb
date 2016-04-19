require 'test/unit'
require_relative '../../quality/sulfuras_quality_calculator'
require_relative 'quality_calculator_contract'

class TestSulfurasQualityCalculator < Test::Unit::TestCase
  include QualityCalculatorContract

  class FakeItem
    attr_accessor :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in = sell_in
      @quality = quality
    end
  end

  def setup
    @subject = SulfurasQualityCalculator.new
  end

  def test_quality_calculator_contract
    validate_quality_calculator_contract(@subject)
  end

  def test_calculate_quality
    item = FakeItem.new(sell_in: 0, quality: 10)
    assert_equal(10, @subject.calculate_quality(item))
  end
end
