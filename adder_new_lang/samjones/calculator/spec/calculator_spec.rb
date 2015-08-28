require 'spec_helper'
require 'calculator/string_calculator'

describe "StringCalculator" do

  it "should have a default value" do
    expect(StringCalculator.new.value).to be(0)

    expect(StringCalculator.new(10).value).to be(10)
  end

  it "should add one value" do
    expect(StringCalculator.new.add("10").value).to be(10)
    expect(StringCalculator.new(15).add("10").value).to be(25)
  end

  it "should add two values" do
    expect(StringCalculator.new.add("10,15").value).to be(25)
    expect(StringCalculator.new(10).add("10,15").value).to be(35)
  end

  it "should subtract one value" do
    expect(StringCalculator.new.subtract("10").value).to be(-10)
    expect(StringCalculator.new(15).subtract("10").value).to be(5)
  end

  it "should subtract two values" do
    expect(StringCalculator.new.subtract("10,15").value).to be(-25)
    expect(StringCalculator.new(50).subtract("10,15").value).to be(25)
  end
end