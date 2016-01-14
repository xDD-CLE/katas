require 'reads_dictionary'

class RetrievesWords

	@@alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

	def initialize(opts = {})
		@reads_dictionary = opts[:reads_dictionary] || ReadsDictionary.new
	end

	def next_word(start_word, opts = {})
		blacklist = opts[:blacklist] || []

		next_word = start_word.dup
		(0..next_word.length-1).each do |i|
			@@alphabet.each do |todays_letter|
				next_word[i] = todays_letter
				return next_word if @reads_dictionary.contains_word(next_word) and not blacklist.include?(next_word)
			end
			next_word[i] = start_word[i]
		end
	end

end
