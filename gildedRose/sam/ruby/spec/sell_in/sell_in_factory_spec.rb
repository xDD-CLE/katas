require 'item'
require 'sell_in/sell_in_calculator_factory'

describe SellInCalculatorFactory do
  let(:item) { instance_double(Item, name: name) }

  subject { SellInCalculatorFactory.for_item item }

  context "for item of sulfuras" do
    let(:name) { 'Sulfuras, Hand of Ragnaros' }
    it { is_expected.to be_kind_of SulfurasSellInCalculator }
  end
  
  context "for other item" do
    let(:name) { 'foo bar' }
    it { is_expected.to be_kind_of SellInCalculator }
  end
end
