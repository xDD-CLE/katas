require 'dbm'

class DBMWrapper
	def initialize
		@file_name = 'tmp/db-'+Time.now.nsec.to_s
		@store = DBM.open(@file_name)
	end

	def []=(key, val)
		@store[key] = val.is_a?(Array) ? val.join(',') : val
	end

	def [](key)
		val = @store[key]
		val.nil? ? nil : val.split(',')
	end

	def keys
		@store.keys
	end

	def has_key?(key)
		@store.has_key?(key)
	end
end
