class HashWrapper
	def initialize
		@store = {}
	end

	def []=(key, val)
		@store[key] = val
	end

	def [](key)
		@store[key]
	end

	def keys
		@store.keys
	end

	def has_key?(key)
		@store.has_key?(key)
	end
end
