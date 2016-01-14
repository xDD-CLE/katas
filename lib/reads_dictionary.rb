class ReadsDictionary

	def initialize(opts = {})
		@file = opts[:dictionary_file] || File.open('assets/wordlist.txt')
	end

	def words
		return @file.each_line.lazy
	end

end
