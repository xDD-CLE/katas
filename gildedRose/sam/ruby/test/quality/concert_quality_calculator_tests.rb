require 'test/unit'
require_relative '../../quality/concert_quality_calculator'
require_relative 'quality_calculator_contract'

class TestConcertQualityCalculator < Test::Unit::TestCase
  include QualityCalculatorContract

  class FakeItem
    attr_accessor :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in = sell_in
      @quality = quality
    end
  end

  def setup
    @subject = ConcertQualityCalculator.new
  end

  def test_quality_calculator_contract
    validate_quality_calculator_contract(@subject)
  end

  def test_calculate_quality_more_than_10_days
    item = FakeItem.new(sell_in: 15, quality: 10)
    assert_equal(11, @subject.calculate_quality(item))
  end

  def test_calculate_quality_10_days
    item = FakeItem.new(sell_in: 10, quality: 10)
    assert_equal(12, @subject.calculate_quality(item))
  end

  def test_calculate_quality_more_than_5_days
    item = FakeItem.new(sell_in: 7, quality: 10)
    assert_equal(12, @subject.calculate_quality(item))
  end

  def test_calculate_quality_5_days
    item = FakeItem.new(sell_in: 5, quality: 10)
    assert_equal(13, @subject.calculate_quality(item))
  end

  def test_calculate_quality_less_than_5_days
    item = FakeItem.new(sell_in: 3, quality: 10)
    assert_equal(13, @subject.calculate_quality(item))
  end

  def test_calculate_quality_0_days
    item = FakeItem.new(sell_in: 0, quality: 10)
    assert_equal(0, @subject.calculate_quality(item))
  end
end
