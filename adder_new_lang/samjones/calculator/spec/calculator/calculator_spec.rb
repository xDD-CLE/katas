require 'calculator/string_calculator'

describe "StringCalculator" do

  it "should have a default value" do
    expect(StringCalculator.new.value).to be(0)
    expect(StringCalculator.new(10).value).to be(10)
  end

  context "add" do
    it "should add one value" do
      expect(StringCalculator.new.add('10').value).to be(10)
      expect(StringCalculator.new(15).add('10').value).to be(25)
    end

    it "should add two values" do
      expect(StringCalculator.new.add('10,15').value).to be(25)
      expect(StringCalculator.new(10).add('10,15').value).to be(35)
    end

    it "should add with line breaks" do
      expect(StringCalculator.new.add("10\n15").value).to be(25)
      expect(StringCalculator.new(10).add("10\n15").value).to be(35)
    end
  end

  context "subtract" do
    it "should subtract one value" do
      expect(StringCalculator.new.subtract('10').value).to be(-10)
      expect(StringCalculator.new(15).subtract('10').value).to be(5)
    end

    it "should subtract two values" do
      expect(StringCalculator.new.subtract('10,15').value).to be(-25)
      expect(StringCalculator.new(50).subtract('10,15').value).to be(25)
    end

    it "should subtract with line breaks" do
      expect(StringCalculator.new.subtract("10\n15").value).to be(-25)
      expect(StringCalculator.new(50).subtract("10\n15").value).to be(25)
    end
  end

  context "multiple delimiters" do
    it "should add with multiple delimiters" do
      expect(StringCalculator.new.add("1,2\n3").value).to be(6)
      expect(StringCalculator.new(5).add("1,2\n3").value).to be(11)
    end

    it "should subtract with multiple delimiters" do
      expect(StringCalculator.new.subtract("1,2\n3").value).to be(-6)
      expect(StringCalculator.new(5).subtract("1,2\n3").value).to be(-1)
    end
  end

  context "custom delimiters" do
    it "should add with a custom delimiter" do
      expect(StringCalculator.new.add("//;\n1;2").value).to be(3)
      expect(StringCalculator.new(5).add("//;\n1;2").value).to be(8)
    end

    it "should add with custom delimiters" do
      expect(StringCalculator.new.add("//[;][#@!]\n1;2#@!3").value).to be(6)
      expect(StringCalculator.new(5).add("//[;][#@!]\n1;2#@!3").value).to be(11)
    end

    it "should subtract with a custom delimiter" do
      expect(StringCalculator.new.subtract("//;\n1;2").value).to be(-3)
      expect(StringCalculator.new(5).subtract("//;\n1;2").value).to be(2)
    end

    it "should subtract with custom delimiters" do
      expect(StringCalculator.new.subtract("//[;][#@!]\n1;2#@!3").value).to be(-6)
      expect(StringCalculator.new(5).subtract("//[;][#@!]\n1;2#@!3").value).to be(-1)
    end
  end
end