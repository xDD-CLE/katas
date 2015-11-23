require 'dbm'
require 'tempfile'

class PersistedTrigramerator
	def initialize(tokenizer, file_name = Time.now.nsec)
		@tokenizer = tokenizer
		@file_name = '.db-'+file_name.to_s
	end

	def trigramerate!
		File.delete(@file_name+'.db') if File.exists?(@file_name+'.db')

		@store = DBM.open(@file_name)
		@tokenizer.words.each_cons(3) do |trigram|
			key = trigram.first(2).join(' ')
			values = @store[key] || ""
			values << ',' unless values.empty?
			values << trigram.last
			@store[key] = values
			@seed = key
		end
		@trigramerated = true
		self
	end

	def seed
		check_state
		@seed
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
