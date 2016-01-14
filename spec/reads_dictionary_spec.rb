require 'reads_dictionary'

describe ReadsDictionary do
	let(:words) {['word1', 'foo', 'bar' ]}

	let(:dictionary_file) { double('file') }

	subject { ReadsDictionary.new(dictionary_file: dictionary_file) }

	it "Should read words from dictionary file" do
		expect(dictionary_file).to receive(:each_line).and_return(words)

		expect(subject.words.force).to eq(words)
	end
end
