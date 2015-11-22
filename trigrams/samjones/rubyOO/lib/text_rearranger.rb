require 'string_tokenizer'

class TextRearranger
	def initialize(trigramerator)
		@trigramerator = trigramerator
	end
	def rearrange
		@trigramerator.seed.tap do |text|
			loop do
				next_word = @trigramerator.value_for(StringTokenizer.last_two_words(text))
				next_word.nil? ? break : text << ' ' + next_word
			end
		end
	end
end
