require 'gilded_rose'
require 'item'
require_relative 'item_contract'
require 'test/unit'

class TestGildedRose < Test::Unit::TestCase
  include ItemContract

  def setup
    @subject = GildedRose.new
  end

  class FakeItem
    def update_quality
      'foobar'
    end
  end

  def test_fake_item_contract
    validate_item_contract(FakeItem.new)
  end

  def test_update_quality
    assert_equal(['foobar'], @subject.update_quality([FakeItem.new]))
  end
end
