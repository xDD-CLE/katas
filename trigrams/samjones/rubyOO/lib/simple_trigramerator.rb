class SimpleTrigramerator
	def initialize(tokenizer)
		@tokenizer = tokenizer
	end
	
	def trigramerate!
		@trigrameration = {}.tap do |hash| 
			@tokenizer.words.each_cons(3) do |trigram|
				(hash[trigram.first(2).join(' ')] ||= []) << trigram[2]
			end
		end
		self
	end

	def seed
		check_state
		String.new(@trigrameration.keys.sample)
	end

	def value_for(key)
		check_state
		@trigrameration.has_key?(key) ? @trigrameration[key].sample : nil
	end
	
	private
	def check_state
		raise 'You must first call trigramerate! to populate your trigramerations' unless defined?(@trigrameration)
	end
end
