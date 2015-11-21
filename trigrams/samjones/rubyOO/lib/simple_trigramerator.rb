class SimpleTrigramerator
	def initialize(tokenizer)
		@tokenizer = tokenizer
	end
	def trigramerate
		{}.tap do |hash| 
			@tokenizer.words.each_cons(3) do |trigram|
				(hash[trigram.first(2).join(' ')] ||= []) << trigram[2]
			end
		end
	end
end
