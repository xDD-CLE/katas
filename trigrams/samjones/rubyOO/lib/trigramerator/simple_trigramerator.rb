require 'data_wrapper/hash_wrapper'
require 'trigramerator/trigramerator'

class SimpleTrigramerator < Trigramerator
	def initialize(tokenizer)
		super(tokenizer, HashWrapper.new)
	end
end
