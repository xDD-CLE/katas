require 'simple_trigramerator'

describe "SimpleTrigramerator" do
	context "when I trigramerate a tokenizer" do
		it "should find followers" do
			tokenizer = double('Tokenizer', words: ['I', 'wish', 'I', 'may', 'I', 'wish', 'I', 'might'])
			trigramerator = SimpleTrigramerator.new(tokenizer)
			expect(trigramerator.trigramerate).to eq({
				"I wish" => ["I", "I"],
				"wish I" => ["may", "might"],
				"may I"  => ["wish"],
				"I may"  => ["I"]
			})
		end
	end
end
