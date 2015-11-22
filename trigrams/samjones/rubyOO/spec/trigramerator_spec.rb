require 'simple_trigramerator'
require 'persisted_trigramerator'

[
	SimpleTrigramerator,
	PersistedTrigramerator
].each do |clazz|
	describe clazz.name do

		context "when I trigramerate a tokenizer" do

			let(:tokenizer) { double('Tokenizer', words: ['I', 'wish', 'I', 'may', 'I', 'wish', 'I', 'might']) }

			let(:results) {{
				"I wish" => ["I"], 
				"wish I" => ["may", "might"], 
				"I may" => ["I"], 
				"may I" => ["wish"]
			}}

			it "should populate trigramerations" do
				trigramerator = clazz.new(tokenizer)
				trigramerator.trigramerate!

				results.each do |key, value|
					expect(trigramerator.value_for(key)).to satisfy{ |s| value.include?(s) }, "Expected key: #{key} to retrieve value included in #{value}, but got #{trigramerator.value_for(key)}"
				end
			end

			it "should retrieve nil when phrase hasn't been trigramerated" do
				trigramerator = clazz.new(tokenizer)
				trigramerator.trigramerate!

				expect(trigramerator.value_for('foo bar')).to be_nil
			end

			it "should seed with one of the keys" do
				trigramerator = clazz.new(tokenizer)
				trigramerator.trigramerate!

				expect(trigramerator.seed).to  satisfy{ |s| results.keys.include?(s) }
			end
		end

		context "when I don't trigramerate a tokenizer" do
			it "should raise an error" do
				trigramerator = clazz.new(double('Tokenizer'))

				expected_error = 'You must first call trigramerate! to populate your trigramerations'

				expect{trigramerator.seed}.to raise_error(expected_error)
				expect{trigramerator.value_for('foo')}.to raise_error(expected_error)
			end
		end
	end
end
