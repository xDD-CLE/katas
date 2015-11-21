require 'simple_trigramerator'

describe "SimpleTrigramerator" do
	context "when I trigramerate a tokenizer" do
		it "should populate trigramerations" do
			tokenizer = double('Tokenizer', words: ['I', 'wish', 'I', 'may', 'I', 'wish', 'I', 'might'])
			trigramerator = SimpleTrigramerator.new(tokenizer)

			trigramerator.trigramerate!

			expect(trigramerator.seed).to_not be_empty

			expect(trigramerator.retrieve("I wish")).to eq(["I", "I"])
			expect(trigramerator.retrieve("wish I")).to eq(["may", "might"])
			expect(trigramerator.retrieve("may I")).to eq( ["wish"])
			expect(trigramerator.retrieve("I may")).to eq( ["I"])
		end
	end
	context "when I don't trigramerate a tokenizer" do
		it "should raise an error" do
			trigramerator = SimpleTrigramerator.new(double('Tokenizer'))

expected_error = 'You must first call trigramerate! to populate your trigramerations'

			expect{trigramerator.seed}.to raise_error(expected_error)
			expect{trigramerator.retrieve('foo')}.to raise_error(expected_error)
		end
	end
end
