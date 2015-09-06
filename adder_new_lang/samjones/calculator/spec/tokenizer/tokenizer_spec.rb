require 'tokenizer/tokenizer.rb'

describe 'Tokenizer' do
  it "should not blow up" do
    expect(Tokenizer.new.ints).to eq([])
    expect(Tokenizer.new.ints('')).to eq([])
  end

  it "should tokenize" do
    expect(Tokenizer.new.tokens('abc')).to eq(['abc'])
    expect(Tokenizer.new.tokens('abc,123')).to eq(['abc', '123'])
  end

  it "should handle multiple delimiters" do
    expect(Tokenizer.new.tokens("1,2\n3")).to eq(['1', '2', '3'])
  end

  it "should handle setting delimiter" do
    expect(Tokenizer.new.tokens("//'\n1'2")).to eq(['1', '2'])
  end

  it "should handle setting multiple delimiters" do
    expect(Tokenizer.new.tokens("//['][#]\n1'2#3")).to eq(['1', '2', '3'])
  end

  it "should handle complex delimiters" do
    expect(Tokenizer.new.tokens("//['#]\n1'#2")).to eq(['1', '2'])
  end

  it "should test for int" do
    expect(Tokenizer.new.is_i?("123")).to eq(true)
    expect(Tokenizer.new.is_i?("abc")).to eq(false)
  end

  it "should return ints" do
    expect(Tokenizer.new.ints('1')).to eq([1])
    expect(Tokenizer.new.ints('1,2')).to eq([1, 2])
  end

  it "should filter non ints" do
    expect(Tokenizer.new.ints('abc,123')).to eq([123])
  end

end