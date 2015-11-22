require 'text_rearranger'
require 'simple_trigramerator'
require 'string_tokenizer'

describe "TextRearranger" do
	context "when I trigramerate some text" do
		it "should be rearranged" do
			trigramerator = double('Trigramerator', seed: 'hello world')
			expect(trigramerator).to receive(:value_for).with('hello world').and_return('foo')
			expect(trigramerator).to receive(:value_for).with('world foo').and_return('bar')
			expect(trigramerator).to receive(:value_for).with('foo bar').and_return(nil)

			rearranger = TextRearranger.new(trigramerator)

			expect(rearranger.rearrange).to eq('hello world foo bar')
		end
	end

	context "when I want to verify integration between pieces" do
		it "should trigramerate some text" do
			rearranger = TextRearranger.new(SimpleTrigramerator.new(StringTokenizer.new('I wish I may I wish I might')).trigramerate!)

			text = rearranger.rearrange

			puts text
			expect(text).to_not be_empty
		end
	end
end
