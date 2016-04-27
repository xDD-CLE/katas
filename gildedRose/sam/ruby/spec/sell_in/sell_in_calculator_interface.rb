shared_examples_for "SellInCalculator" do
  describe "implements calculate_sell_in" do
    let(:calculator) { described_class.new }
    it "calculates new sell in" do
      calculator.should respond_to(:calculate_sell_in)
    end
  end
end
