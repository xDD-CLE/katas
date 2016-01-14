require 'retrieves_words'

describe RetrievesWords do
	let(:reads_dictionary) { double('reads_dictionary') }

	subject { RetrievesWords.new(reads_dictionary: reads_dictionary) }

	context "finding next word with dictionary" do
		let(:start_word) { 'ruby' }
		let(:next_word) { 'rube' }

		it "Should retrieve the next word" do
			expect(reads_dictionary).to receive(:contains_word).with(next_word).and_return(true).once
			expect(reads_dictionary).to receive(:contains_word).and_return(false).at_least(:once)

			expect(subject.next_word(start_word)).to eq(next_word)
		end
	end

	context "filtering next word from blacklist" do
		let(:blacklist) {[ 'foo', 'bar' ]}

		let(:start_word) { 'poo' }
		let(:blacklisted_word) { 'foo' }
		let(:next_word) { 'loo' }

		it "Should blacklist words" do
			expect(reads_dictionary).to receive(:contains_word).with(next_word).and_return(true).once
			expect(reads_dictionary).to receive(:contains_word).with(blacklisted_word).and_return(true).once
			expect(reads_dictionary).to receive(:contains_word).and_return(false).at_least(:once)

			expect(subject.next_word(start_word, blacklist: blacklist)).to eq(next_word)
		end
	end
end
