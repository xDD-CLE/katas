require 'pry'

class Trigram
	def build(words)
		@trigram_hash = Hash.new
		
		input_words = words.split(' ')
		#input_words = ["I", "wish", "I", "may"]

		build_trigram_arrays(input_words)
		
	end

	def ask(two_words)
		two_words = remove_punctuation(two_words)
		if @trigram_hash.has_key?(two_words) 
			@trigram_hash[two_words]
		else
			[]
		end
	end

	private
		def build_one_trigram(input_words)
			first_two_words = remove_punctuation(input_words[0..1].join(' '))
			next_word = remove_punctuation(input_words[2])

			if @trigram_hash.has_key?(first_two_words)
				@trigram_hash[first_two_words].push(next_word).uniq!
			else
				@trigram_hash[first_two_words] = [next_word]
			end
		end

		def build_trigram_arrays(input_words)
			while input_words.length >= 3
					start_element = 0
					end_element = start_element + 2

					three_element_array = input_words[start_element..end_element]
					build_one_trigram(three_element_array)

					input_words.shift
			end	
		end

		def remove_punctuation(word)
			word.gsub(/^[\?\'\:\,\"\.\!\(\)\-\_]|[\?\'\:\,\"\.\!\(\)\-\_]$/,'')
		end
end


