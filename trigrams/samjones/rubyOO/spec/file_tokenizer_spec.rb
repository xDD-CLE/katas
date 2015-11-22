require 'tempfile'
require 'file_tokenizer'

describe "FileTokenizer" do
	context "When I tokenize a file" do
		it "should return a list of words" do
			file = newTempFile("hello world.\nFoo Bar!")
			tokenizer = FileTokenizer.new(file.path)

			expect(tokenizer.words.force).to eq(['hello', 'world', 'Foo', 'Bar'])

			file.close!
		end	
	end
end

def newTempFile(contents)
	file = Tempfile.new('tokenizer')
	file.write(contents)
	file.rewind
	file
end
