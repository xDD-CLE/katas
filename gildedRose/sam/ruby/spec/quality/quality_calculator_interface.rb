shared_examples_for "QualityCalculator" do
  describe "implements calculate_quality" do
    let(:calculator) { described_class.new }
    it "calculates new quality" do
      calculator.should respond_to(:calculate_quality)
    end
  end
end
