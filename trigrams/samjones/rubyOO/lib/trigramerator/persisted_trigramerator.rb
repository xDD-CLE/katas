require 'dbm'
require 'tempfile'

class PersistedTrigramerator
	def initialize(tokenizer)
		@tokenizer = tokenizer
		@file_name = '.db-'+Time.now.nsec.to_s
	end

	def trigramerate!
		File.delete(@file_name+'.db') if File.exists?(@file_name+'.db')

		@store = DBM.open(@file_name)
		@tokenizer.words.each_cons(3) do |trigram|
			key = trigram.first(2).join(' ')
			@store[key] = @store.has_key?(key) ? @store[key] << ',' + trigram.last : trigram.last
		end
		self
	end

	def seed
		check_state
		@store.keys.sample
	end

	def value_for(key)
		check_state
		value = @store[key] 
		value.nil? ? nil : value.split(',').sample
	end

	private
	def check_state
		raise 'You must first call trigramerate! to populate your trigramerations' unless defined?(@store)
	end

end
