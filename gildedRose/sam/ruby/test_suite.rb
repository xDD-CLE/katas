base_dir = File.expand_path(File.join(File.dirname(__FILE__), "."))
lib_dir  = File.join(base_dir, "lib")
$LOAD_PATH.unshift(lib_dir)

Dir['test/**/*_tests.rb'].each do |test|
  require_relative test
end

class EndToEndTest < Test::Unit::TestCase
  def setup
    @subject = GildedRose.new
  end
  def test_end_to_end_functionality
    item = Item.new(name: 'foo', sell_in: 10, quality: 20)

    results = @subject.update_quality([item])

    assert_equal(9, results.first.sell_in)
    assert_equal(19, results.first.quality)
  end
end
