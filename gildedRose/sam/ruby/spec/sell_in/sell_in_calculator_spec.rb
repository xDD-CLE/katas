require 'item'
require 'sell_in/sell_in_calculator'
require_relative 'sell_in_calculator_interface'

describe SellInCalculator do

  it_behaves_like "SellInCalculator"

  let(:item) { instance_double(Item, sell_in: 10, quality: 20) }

  it "should decrease sell in by 1" do
    expect(subject.calculate_sell_in(item)).to be(9)
  end
end
