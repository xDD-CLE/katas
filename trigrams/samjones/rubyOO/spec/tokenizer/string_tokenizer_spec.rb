require 'tokenizer/string_tokenizer'

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
			},{
				string: "one\ntwo",
				delim: '\n',
				result: ['one', 'two']
			}, {
				string: "one-two",
				delim: '-',
				result: ['one', 'two']
			}
		].each do |test| 
			it "should seperate on non word char '#{test[:delim]}'" do
				expect(StringTokenizer.new(test[:string]).words).to eq(test[:result])
			end
		end
	end
	it "should return the last two words of text" do
		expect(StringTokenizer.last_two_words("hello world foo!")).to eq('world foo')
	end
end
