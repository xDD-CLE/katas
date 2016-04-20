require 'item'
require 'sell_in/sulfuras_sell_in_calculator'

describe SulfurasSellInCalculator do

  let(:item) { instance_double(Item, sell_in: 10, quality: 20) }

  it "should not change sell in" do
    expect(subject.calculate_sell_in(item)).to be(10)
  end
end
