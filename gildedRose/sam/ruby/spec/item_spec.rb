require 'item'
require 'quality/quality_calculator_factory'
require 'sell_in/sell_in_calculator_factory'

describe Item do
  let(:name) { 'Foo' }
  let(:sell_in) { 10  }
  let(:quality) { 20 }

  context "after creation" do
    subject { Item.new(name: name, 
                       sell_in: sell_in, 
                       quality: quality) }

    it "should have a name" do
      expect(subject.name).to be(name)
    end
    it "should have a sell in" do
      expect(subject.sell_in).to be(sell_in)
    end
    it "should have a quality" do
      expect(subject.quality).to be(quality)
    end
  end

  context "when updating quality" do
    let(:new_quality) { 18 }
    let(:quality_calculator) { double('quality_calculator', calculate_quality: new_quality) }
    let(:quality_calculator_factory) { class_double(QualityCalculatorFactory, for_item: quality_calculator) }

    let(:new_sell_in) { 9 }
    let(:sell_in_calculator) { double('sell_in_calculator', calculate_sell_in: new_sell_in) }
    let(:sell_in_calculator_factory) { class_double(SellInCalculatorFactory, for_item: sell_in_calculator) }

    subject { Item.new(name: name, 
                       sell_in: sell_in, 
                       quality: quality,
                       quality_calculator_factory: quality_calculator_factory,
                       sell_in_calculator_factory: sell_in_calculator_factory).update_quality }


    it "should reflect the newly calculated quality" do
      expect(subject.quality).to be(new_quality)
    end
    it "should have an updated sell in" do
      expect(subject.sell_in).to be(new_sell_in)
    end
  end
end
