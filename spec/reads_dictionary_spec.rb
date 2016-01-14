require 'reads_dictionary'

describe ReadsDictionary do
	let(:words) {['word1', 'foo', 'bar' ]}
	let(:has_this_word) { 'foo' }
	let(:doesnt_have_this_word) { 'baz' }

	let(:dictionary_file) { double('file') }

	subject { ReadsDictionary.new(dictionary_file: dictionary_file) }

	context "#contains_word" do
		before(:each) do
			expect(dictionary_file).to receive(:each_line).and_return(words)
		end

		it "Should contain word" do
			expect(subject.contains_word(has_this_word)).to eq(true)
		end

		it "Should not contain word" do
			expect(subject.contains_word(doesnt_have_this_word)).to eq(false)
		end
	end
end
