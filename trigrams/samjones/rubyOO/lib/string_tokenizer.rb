class StringTokenizer
	def initialize(string)
		@string = string
	end

	def words
		@string.split(/\W+/)
	end

	def self.last_two_words(text)
		self.new(text).words.last(2).join(' ')
	end
end
