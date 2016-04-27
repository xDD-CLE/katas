require 'item'
require 'quality/concert_quality_calculator'
require_relative 'quality_calculator_interface'

describe ConcertQualityCalculator do

  it_behaves_like "QualityCalculator"

  let(:item) { instance_double(Item, sell_in: sell_in, quality: 20) }

  context "more than 10 days before sell in date" do
    let(:sell_in) { 11 }
    it "should increase quality by 1" do
      expect(subject.calculate_quality(item)).to be(21)
    end
  end

  context "10 days before sell in date" do
    let(:sell_in) { 10 }
    it "should increase quality by 2" do
      expect(subject.calculate_quality(item)).to be(22)
    end
  end

  context "5 days before sell in date" do
    let(:sell_in) { 5 }
    it "should increase quality by 3" do
      expect(subject.calculate_quality(item)).to be(23)
    end
  end

  context "after sell in date" do
    let(:sell_in) { 0 }
    it "should quality becomes zero" do
      expect(subject.calculate_quality(item)).to be(0)
    end
  end
end
