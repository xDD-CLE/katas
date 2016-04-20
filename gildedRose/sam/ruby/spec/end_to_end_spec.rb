require 'item'
require 'gilded_rose'

describe "End to end testing" do
  
  let(:item) { Item.new(name: 'foo', sell_in: 10, quality: 20) }

  subject { GildedRose.new.update_quality([item]).first }

  it "should update the sell in of the item" do
    expect(subject.sell_in).to be(9)
  end

  it "should update the quality of the item" do
    expect(subject.quality).to be(19)
  end
end
