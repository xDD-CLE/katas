require 'item'
require 'quality/quality_calculator'

describe QualityCalculator do

  let(:item) { instance_double(Item, sell_in: sell_in, quality: 20) }

  context "before sell in date" do
    let(:sell_in) { 10 }
    it "should decrease quality by 1" do
      expect(subject.calculate_quality(item)).to be(19)
    end
  end

  context "after sell in date" do
    let(:sell_in) { 0 }
    it "should decrease quality by 2" do
      expect(subject.calculate_quality(item)).to be(18)
    end
  end
end
