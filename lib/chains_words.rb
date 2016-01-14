require 'retrieves_words'

class ChainsWords

	def initialize(opts = {})
		@retrieves_words = opts[:retrieves_words] || RetrievesWords.new
	end

	def chain_words(start_word, end_word)
		[start_word].tap do |acc|
			until acc.last == end_word
				acc << @retrieves_words.next_word(acc.last)
			end
		end
	end
end
