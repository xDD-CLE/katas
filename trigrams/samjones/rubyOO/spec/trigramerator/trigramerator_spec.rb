require 'trigramerator/simple_trigramerator'
require 'trigramerator/persisted_trigramerator'

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

				results.each do |key, value|
					real = trigramerator.value_for(key)
					str = "Expected result \"#{real}\" for key \"#{key}\" to be included in #{value}"
					expect(real).to satisfy{ |s| value.include?(s) }, str
				end
			end

			it "should retrieve nil when desired phrase hasn't been trigramerated" do
				trigramerator = clazz.new(tokenizer)

				expect(trigramerator.value_for('foo bar')).to be_nil
			end

			it "should seed with one of the keys" do
				trigramerator = clazz.new(tokenizer)

				expect(trigramerator.seed).to  satisfy{ |s| results.keys.include?(s) }
			end
		end
	end
end
