require 'rearranger/text_rearranger'
require 'trigramerator/simple_trigramerator'
require 'trigramerator/persisted_trigramerator'
require 'tokenizer/string_tokenizer'
require 'tokenizer/file_tokenizer'

describe "TextRearranger" do
	context "when I trigramerate some text" do
		it "should be rearranged" do
			trigramerator = double('Trigramerator')

			expect(trigramerator).to receive(:seed).and_return('hello world')
			expect(trigramerator).to receive(:value_for).with('hello world').and_return('foo')
			expect(trigramerator).to receive(:value_for).with('world foo').and_return('bar')
			expect(trigramerator).to receive(:value_for).with('foo bar').and_return(nil)

			rearranger = TextRearranger.new(trigramerator)

			expect(rearranger.rearrange).to eq('hello world foo bar')
		end
	end

	context "when I want to verify integration between pieces" do
		it "should trigramerate with SimpleTrigramerator and StringTokenizer" do
			rearranger = TextRearranger.new(SimpleTrigramerator.new(StringTokenizer.new('I wish I may I wish I might')))

			text = rearranger.rearrange

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end

		it "should trigramerate with PersistedTrigramerator and StringTokenizer" do
			rearranger = TextRearranger.new(PersistedTrigramerator.new(StringTokenizer.new('I wish I may I wish I might')))

			text = rearranger.rearrange

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end

		it "should trigramerate with SimpleTrigramerator and FileTokenizer" do
			rearranger = TextRearranger.new(SimpleTrigramerator.new(FileTokenizer.new(new_temp_file('I wish I may I wish I might').path)))

			text = rearranger.rearrange

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end
	
		it "should trigramerate with PersistedTrigramerator and FileTokenizer" do
			rearranger = TextRearranger.new(PersistedTrigramerator.new(FileTokenizer.new(new_temp_file('I wish I may I wish I might'))))

			text = rearranger.rearrange

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end
	end
end
