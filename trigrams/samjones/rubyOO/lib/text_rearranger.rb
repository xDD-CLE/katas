require 'string_tokenizer'

class TextRearranger
	def initialize(trigramerator)
		@trigramerator = trigramerator
	end
	def rearrange
		@trigramerator.seed.tap do |text|
			begin
				text << ' ' + @trigramerator.retrieve(StringTokenizer.last_two_words(text))
			end while @trigramerator.has_record?(StringTokenizer.last_two_words(text))
		end
	end
end
