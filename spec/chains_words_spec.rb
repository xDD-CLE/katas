require 'chains_words'

describe ChainsWords do
	let(:start_word) { "ruby" }
	let(:next_word) { "rube" }
	let(:end_word) { "robe" }

	let(:retrieves_words) { double('retrieves_words') }

	subject { ChainsWords.new(retrieves_words: retrieves_words) }
	
	it "Should chain words" do
		expect(retrieves_words).to receive(:next_word).with(start_word).and_return(next_word)
		expect(retrieves_words).to receive(:next_word).with(next_word).and_return(end_word)

		expect(subject.chain_words(start_word, end_word)).to eq([start_word, next_word, end_word])
	end
end
