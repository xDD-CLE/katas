require 'string_tokenizer'

class TextRearranger
	def initialize(trigramerator)
		@trigramerator = trigramerator
	end
	def rearrange
		dictionary = @trigramerator.trigramerate
		last_words = dictionary.keys.sample
		new_text = String.new(last_words)
		begin
			next_word = dictionary[last_words].sample
			new_text << ' ' + next_word
			last_words = StringTokenizer.new(last_words + ' ' + next_word).words.last(2).join(' ')
		end while dictionary.has_key?(last_words)
		new_text
	end
end
