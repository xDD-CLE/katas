require 'pstore'
require 'tempfile'

class PersistedTrigramerator
	def initialize(tokenizer)
		@tokenizer = tokenizer
	end

	def trigramerate!
		File.delete('data') if File.exists?('data')
		@store = PStore.new('data')
		@tokenizer.words.each_cons(3) do |trigram|
			@store.transaction do
				key = trigram.first(2).join(' ')
				values = @store[key] || []
				values << trigram.last
				@store[key] = values
				@seed = key
			end
		end
		@trigramerated = true
	end

	def seed
		check_state
		@seed
	end

	def value_for(key)
		check_state
		value = @store.transaction { @store[key] }
		value.nil? ? nil : value.sample
	end

	private
	def check_state
		raise 'You must first call trigramerate! to populate your trigramerations' unless defined?(@store)
	end

end
