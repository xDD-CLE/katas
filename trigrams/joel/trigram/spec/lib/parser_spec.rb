require 'spec_helper'
describe Trigram::Parser do
  let(:parser) { Trigram::Parser.new }
  it 'builds a list of sequences for every third word' do
    expect {
      parser.feed('a b c')
    }.to change{ parser.sequences.count }.by 1
  end
  it 'parses out two sequences when given 4 words'
end
