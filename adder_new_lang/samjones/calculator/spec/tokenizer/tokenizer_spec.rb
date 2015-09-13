require 'tokenizer/tokenizer.rb'

describe Tokenizer do

  let(:tokenizer) { Class.new { include Tokenizer }.new }


  it 'should not blow up' do
    expect(tokenizer.ints).to eq([])
    expect(tokenizer.ints('')).to eq([])
  end


  it 'should tokenize' do
    expect(tokenizer.tokens('abc')).to eq(['abc'])
    expect(tokenizer.tokens('abc,123')).to eq(['abc', '123'])
  end


  it 'should handle multiple delimiters' do
    expect(tokenizer.tokens("1,2\n3")).to eq(['1', '2', '3'])
  end


  it 'should handle setting delimiter' do
    expect(tokenizer.tokens("//'\n1'2")).to eq(['1', '2'])
  end


  it 'should handle setting multiple delimiters' do
    expect(tokenizer.tokens("//['][#]\n1'2#3")).to eq(['1', '2', '3'])
  end


  it 'should handle complex delimiters' do
    expect(tokenizer.tokens("//['#]\n1'#2")).to eq(['1', '2'])
  end


  it 'should test for int' do
    expect(tokenizer.is_i?("123")).to eq(true)
    expect(tokenizer.is_i?("abc")).to eq(false)
  end


  it 'should return ints' do
    expect(tokenizer.ints('1')).to eq([1])
    expect(tokenizer.ints('1,2')).to eq([1, 2])
  end


  it 'should filter non ints' do
    expect(tokenizer.ints('abc,123')).to eq([123])
  end

end