require 'item'
require 'sell_in/sell_in_calculator'

describe SellInCalculator do

  let(:item) { instance_double(Item, sell_in: 10, quality: 20) }

  it "should decrease sell in by 1" do
    expect(subject.calculate_sell_in(item)).to be(9)
  end
end
