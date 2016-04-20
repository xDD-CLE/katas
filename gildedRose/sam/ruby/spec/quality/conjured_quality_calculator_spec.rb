require 'item'
require 'quality/conjured_quality_calculator'

describe ConjuredQualityCalculator do

  let(:item) { instance_double(Item, sell_in: sell_in, quality: 20) }

  context "before sell in date" do
    let(:sell_in) { 10 }
    it "should decrease quality by 2" do
      expect(subject.calculate_quality(item)).to be(18)
    end
  end

  context "after sell in date" do
    let(:sell_in) { 0 }
    it "should decrease quality by 4" do
      expect(subject.calculate_quality(item)).to be(16)
    end
  end
end
