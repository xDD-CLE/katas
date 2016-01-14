require 'retrieves_words'

describe RetrievesWords do
	let(:start_word) { 'ruby' }
	let(:next_word) { 'rube' }
	let(:dictionary_words) {['foo', 'test', 'rube', 'bar' ]}

	let(:reads_dictionary) { double('reads_dictionary') }

	subject { RetrievesWords.new(reads_dictionary: reads_dictionary) }

	it "Should retrieve the next word" do
		expect(reads_dictionary).to receive(:words).and_return(dictionary_words)

		expect(subject.next_word(start_word)).to eq(next_word)
	end
end
