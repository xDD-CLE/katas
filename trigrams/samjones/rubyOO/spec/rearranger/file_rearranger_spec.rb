require 'rearranger/file_rearranger'
require 'trigramerator/simple_trigramerator'
require 'trigramerator/persisted_trigramerator'
require 'tokenizer/string_tokenizer'
require 'tokenizer/file_tokenizer'

describe "FileRearranger" do
	context "when I trigramerate a file" do
		it "should be rearranged" do
			trigramerator = double('Trigramerator')

			expect(trigramerator).to receive(:seed).and_return('hello world')
			expect(trigramerator).to receive(:value_for).with('hello world').and_return('foo')
			expect(trigramerator).to receive(:value_for).with('world foo').and_return('bar')
			expect(trigramerator).to receive(:value_for).with('foo bar').and_return(nil)

			file = new_temp_file('')
			rearranger = FileRearranger.new(trigramerator)
			rearranger.rearrange(file.path)

			expect(file.read).to eq('hello world foo bar')
		end
	end

	context "when I want to verify integration between pieces" do
		it "should trigramerate with SimpleTrigramerator and StringTokenizer" do
			rearranger = FileRearranger.new(SimpleTrigramerator.new(StringTokenizer.new('I wish I may I wish I might')))

			file = new_temp_file('')
			rearranger.rearrange(file.path)
			text = file.read

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end

		it "should trigramerate with PersistedTrigramerator and StringTokenizer" do
			rearranger = FileRearranger.new(PersistedTrigramerator.new(StringTokenizer.new('I wish I may I wish I might')))

			file = new_temp_file('')
			rearranger.rearrange(file.path)
			text = file.read

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end

		it "should trigramerate with SimpleTrigramerator and FileTokenizer" do
			rearranger = FileRearranger.new(SimpleTrigramerator.new(FileTokenizer.new(new_temp_file('I wish I may I wish I might').path)))

			file = new_temp_file('')
			rearranger.rearrange(file.path)
			text = file.read

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end

		it "should trigramerate with PersistedTrigramerator and FileTokenizer" do
			rearranger = FileRearranger.new(PersistedTrigramerator.new(FileTokenizer.new(new_temp_file('I wish I may I wish I might'))))

			file = new_temp_file('')
			rearranger.rearrange(file.path)
			text = file.read

			# what else to test here?
			puts "\t\t#{text}"
			expect(text).to_not be_empty
		end
	end

	context "when I use a very large file" do
		it "should not barf while rarranging" do
			rearranger = FileRearranger.new(PersistedTrigramerator.new(FileTokenizer.new('moby_dick.txt')))

			File.delete('moby_output.txt') if File.exists?('moby_output.txt')
			file = File.open('moby_output.txt', 'w')
			rearranger.rearrange(file.path)

			expect(FileTokenizer.new(file.path).words.count > 0).to eq(true)

		end
	end
end
