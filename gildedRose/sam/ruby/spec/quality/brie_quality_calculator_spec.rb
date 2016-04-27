require 'item'
require 'quality/brie_quality_calculator'
require_relative 'quality_calculator_interface'

describe BrieQualityCalculator do

  it_behaves_like "QualityCalculator"

  let(:item) { instance_double(Item, sell_in: sell_in, quality: 20) }

  context "before sell in date" do
    let(:sell_in) { 10 }
    it "should increase quality by 1" do
      expect(subject.calculate_quality(item)).to be(21)
    end
  end

  context "after sell in date" do
    let(:sell_in) { 0 }
    it "should increase quality by 2" do
      expect(subject.calculate_quality(item)).to be(22)
    end
  end
end
