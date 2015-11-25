require 'tempfile'
require 'tokenizer/file_tokenizer'

describe "FileTokenizer" do
	context "When I tokenize a file" do
		it "should return a list of words" do
			file = new_temp_file("hello world.\nFoo Bar!")
			tokenizer = FileTokenizer.new(file.path)

			expect(tokenizer.words.force).to eq(['hello', 'world', 'Foo', 'Bar'])

			file.close!
		end	
	end
end

