require 'pry'

class Trigram
	def parse(string)

		trigrams_hash = Hash.new(0)

		key_string = string.split[0..1].join(' ')
		value_word = string.split[2]

		trigrams_hash[key_string] = value_word

		trigrams_hash
			
	end
end
