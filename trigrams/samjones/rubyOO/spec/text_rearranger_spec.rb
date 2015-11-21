require 'text_rearranger'

describe "TextRearranger" do
	context "when I trigramerate some text" do
		it "should be rearranged" do
			trigramerator = double('Trigramerator', seed: 'hello world')
			expect(trigramerator).to receive(:retrieve).with('hello world').and_return('foo')
			expect(trigramerator).to receive(:retrieve).with('world foo').and_return('bar')
			expect(trigramerator).to receive(:has_record?).with('world foo').and_return(true)
			expect(trigramerator).to receive(:has_record?).with('foo bar').and_return(false)

			rearranger = TextRearranger.new(trigramerator)

			text =  rearranger.rearrange
			expect(text).to eq('hello world foo bar')
		end
	end
end
