require 'item'
require 'quality/quality_calculator_factory'

describe QualityCalculatorFactory do
  let(:item) { instance_double(Item, name: name) }

  subject { QualityCalculatorFactory.for_item item }

  context "for item of sulfuras" do
    let(:name) { 'Sulfuras, Hand of Ragnaros' }
    it { is_expected.to be_kind_of SulfurasQualityCalculator }
  end

  context "for item of aged brie" do
    let(:name) { 'Aged Brie' }
    it { is_expected.to be_kind_of BrieQualityCalculator }
  end

  context "for item of backstage tickets" do
    let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }
    it { is_expected.to be_kind_of ConcertQualityCalculator }
  end

  context "for conjured item" do
    let(:name) { 'Conjured Item' }
    it { is_expected.to be_kind_of ConjuredQualityCalculator }
  end

  context "for other item" do
    let(:name) { 'foo bar' }
    it { is_expected.to be_kind_of QualityCalculator }
  end
end
