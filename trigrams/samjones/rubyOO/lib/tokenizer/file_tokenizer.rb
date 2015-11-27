require 'tokenizer/string_tokenizer'

class FileTokenizer
	def initialize(file_path)
		@file_path = file_path
	end

	def words
		File.open(@file_path).each_line.lazy.flat_map { |line| StringTokenizer.new(line).words }
	end
end
