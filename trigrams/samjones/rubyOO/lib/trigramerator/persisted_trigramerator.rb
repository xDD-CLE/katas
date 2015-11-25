require 'data_wrapper/dbm_wrapper'
require 'trigramerator/trigramerator'

class PersistedTrigramerator < Trigramerator
	def initialize(tokenizer)
		super(tokenizer, DBMWrapper.new)
	end
end
