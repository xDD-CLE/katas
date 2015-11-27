class Trigramerator
	def initialize(tokenizer, store)
		@tokenizer = tokenizer
		@store = store

		count = 0
		@tokenizer.words.each_cons(3) do |trigram|
			key = trigram.first(2).join(' ')
			@store[key] = (@store[key] || []) << trigram[2]
			puts "#{count} records processed" if count %10 == 1
		end

		self
	end

	def seed
		String.new(@store.keys.sample)
	end

	def value_for(key)
		@store.has_key?(key) ? @store[key].sample : nil
	end

end
