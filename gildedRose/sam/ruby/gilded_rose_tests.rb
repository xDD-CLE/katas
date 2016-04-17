require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def setup
    @subject = GildedRose.new
  end

  def item_tester(item:, new_sell_in:, new_quality:)
    actual = @subject.update_quality([item]).first
    assert_equal(new_sell_in, actual.sell_in)
    assert_equal(new_quality, actual.quality)
  end

  def test_foo
    item = Item.new(name: "foo", sell_in: 5, quality: 10)
    item_tester(item: item, new_sell_in: 4, new_quality: 9)
  end

  def test_foo_0_days
    item = Item.new(name: "foo", sell_in: 0, quality: 10)
    item_tester(item: item, new_sell_in: -1, new_quality: 8)
  end

  def test_brie
    item = Item.new(name: "Aged Brie", sell_in: 5, quality: 10)
    item_tester(item: item, new_sell_in: 4, new_quality: 11)
  end

  def test_brie_0_days
    item = Item.new(name: "Aged Brie", sell_in: 0, quality: 10)
    item_tester(item: item, new_sell_in: -1, new_quality: 12)
  end

  def test_brie_0_days_high_quality
    item = Item.new(name: "Aged Brie", sell_in: 0, quality: 50)
    item_tester(item: item, new_sell_in: -1, new_quality: 50)
  end

  def test_concert_11_days
    item = Item.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: 10)
    item_tester(item: item, new_sell_in: 10, new_quality: 11)
  end

  def test_concert_10_days
    item = Item.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 10)
    item_tester(item: item, new_sell_in: 9, new_quality: 12)
  end

  def test_concert_6_days
    item = Item.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 10)
    item_tester(item: item, new_sell_in: 5, new_quality: 12)
  end

  def test_concert_5_days
    item = Item.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 10)
    item_tester(item: item, new_sell_in: 4, new_quality: 13)
  end

  def test_concert_0_days
    item = Item.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 10)
    item_tester(item: item, new_sell_in: -1, new_quality: 0)
  end

  def test_concert_high_quality
    item = Item.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 50)
    item_tester(item: item, new_sell_in: 9, new_quality: 50)
  end

  def test_sulfuras
    item = Item.new(name: "Sulfuras, Hand of Ragnaros", sell_in: 10, quality: 50)
    item_tester(item: item, new_sell_in: 10, new_quality: 50)
  end

end
