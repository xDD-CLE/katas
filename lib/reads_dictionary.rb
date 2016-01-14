class ReadsDictionary

	def initialize(opts = {})
		@file = opts[:dictionary_file] || File.open('assets/wordlist.txt')
	end

	def contains_word(word)
		return @file.each_line.any? do |line|
			line.chomp == word
		end
	end

end
