require 'retrieves_words'

describe RetrievesWords do
	let(:start_word) { 'ruby' }
	let(:next_word) { 'rube' }

	let(:reads_dictionary) { double('reads_dictionary') }

	subject { RetrievesWords.new(reads_dictionary: reads_dictionary) }

	it "Should retrieve the next word" do
		expect(reads_dictionary).to receive(:contains_word).with(next_word).and_return(true).once
		expect(reads_dictionary).to receive(:contains_word).and_return(false).at_least(:once)

		expect(subject.next_word(start_word)).to eq(next_word)
	end
end
