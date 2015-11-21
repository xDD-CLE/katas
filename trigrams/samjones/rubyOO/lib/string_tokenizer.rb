class StringTokenizer
	def initialize(string)
		@string = string
	end
	def words
		@string.split(/\W+/)
	end
end
