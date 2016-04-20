require 'item'
require 'gilded_rose'

describe GildedRose do
  let(:item) {instance_double(Item, update_quality: 'foobar')}

  it "should update item's quality" do
    expect(subject.update_quality([item])).to eq(['foobar'])
  end
end
