require 'reads_dictionary'

class RetrievesWords

	def initialize(opts = {})
		@reads_dictionary = opts[:reads_dictionary] || ReadsDictionary.new
	end

	def next_word(start_word)
		@reads_dictionary.words.find do |word|
			same_size(start_word, word) and one_letter_difference(start_word, word)
		end
	end

	private
		def same_size(word_one, word_two)
			word_one.length == word_two.length
		end

		def one_letter_difference(word_one, word_two)
			differences = 0
			
			word_one.each_char.each_with_index do |char, i|
				differences = differences + 1 unless char == word_two[i]
			end

			return differences == 1
		end
end
