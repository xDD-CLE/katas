require 'simple_trigramerator'

describe "SimpleTrigramerator" do
	context "when I trigramerate a tokenizer" do
		let(:tokenizer) { double('Tokenizer', words: ['I', 'wish', 'I', 'may', 'I', 'wish', 'I', 'might']) }
		let(:results) {{
			"I wish" => ["I"], 
			"wish I" => ["may", "might"], 
			"I may" => ["I"], 
			"may I" => ["wish"]
		}}

		it "should populate trigramerations" do
			trigramerator = SimpleTrigramerator.new(tokenizer)
			trigramerator.trigramerate!

			results.each do |key, value|
				expect(trigramerator.value_for(key)).to satisfy{ |s| value.include?(s) }
			end
		end

		it "should retrieve nil when phrase hasn't been trigramerated" do
			trigramerator = SimpleTrigramerator.new(tokenizer)
			trigramerator.trigramerate!

			expect(trigramerator.value_for('foo bar')).to be_nil
		end

		it "should seed with one of the keys" do
			trigramerator = SimpleTrigramerator.new(tokenizer)
			trigramerator.trigramerate!

			expect(trigramerator.seed).to  satisfy{ |s| results.keys.include?(s) }
		end
	end

	context "when I don't trigramerate a tokenizer" do
		it "should raise an error" do
			trigramerator = SimpleTrigramerator.new(double('Tokenizer'))

			expected_error = 'You must first call trigramerate! to populate your trigramerations'

			expect{trigramerator.seed}.to raise_error(expected_error)
			expect{trigramerator.value_for('foo')}.to raise_error(expected_error)
		end
	end
end
