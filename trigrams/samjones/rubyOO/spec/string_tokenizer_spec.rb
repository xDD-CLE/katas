require 'string_tokenizer'

describe "StringTokenizer" do
	context "when I tokenize a string" do
		it "should return a list of words" do
			tokenizer = StringTokenizer.new "I wish I may I wish I might"
			expect(tokenizer.words).to eq(['I', 'wish', 'I', 'may', 'I', 'wish', 'I', 'might'])
		end

		[
			{ 
				string: "one two",
				result: ['one', 'two']
			}, {
				string: "one.two",
				result: ['one', 'two']
			}, {
				string: "one.two",
				delim: '.',
				result: ['one', 'two']
			}, {
				string: "one,two",
				delim: ',',
				result: ['one', 'two']
			}, {
				string: "one:two",
				delim: ':',
				result: ['one', 'two']
			}, {
				string: "one, two",
				delim: ', ',
				result: ['one', 'two']
			}, {
				string: "one_two",
				delim: '_',
				result: ['one', 'two']
			}, {
				string: "one\ntwo",
				delim: '\n',
				result: ['one', 'two']
			}, {
				string: "one-two",
				delim: '-',
				result: ['one', 'two']
			}
		].each do |test| 
			it "should respect non word char '#{test[:delim]}'" do

			end
		end
	end
end
