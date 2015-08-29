require 'tokenizer/tokenizer.rb'

describe 'Tokenizer' do
  it "should not blow up" do
    expect(Tokenizer.new.ints).to eq([])
    expect(Tokenizer.new('').ints).to eq([])
  end

  it "should tokenize" do
    expect(Tokenizer.new('abc').tokens).to eq(['abc'])
    expect(Tokenizer.new('abc,123').tokens).to eq(['abc','123'])
  end

  it "should handle multiple delimiters" do
    expect(Tokenizer.new("1,2\n3").tokens).to eq(['1','2','3'])
  end

  it "should test for int" do
    expect(Tokenizer.new.is_i?("123")).to eq(true)
    expect(Tokenizer.new.is_i?("abc")).to eq(false)
  end

  it "should return ints" do
    expect(Tokenizer.new('1').ints).to eq([1])
    expect(Tokenizer.new('1,2').ints).to eq([1,2])
  end

  it "should filter non ints" do
    expect(Tokenizer.new('abc,123').ints).to eq([123])
  end

end