require 'item'
require 'quality/sulfuras_quality_calculator'
require_relative 'quality_calculator_interface'

describe SulfurasQualityCalculator do

  it_behaves_like "QualityCalculator"

  let(:quality) { 20 }
  let(:item) { instance_double(Item, sell_in: 10, quality: quality) }

  it "should not change quantity" do
    expect(subject.calculate_quality(item)).to be(quality)
  end
end
