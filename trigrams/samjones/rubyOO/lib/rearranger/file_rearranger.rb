require 'tokenizer/string_tokenizer'
require 'rearranger/rearranger'

class FileRearranger < Rearranger
	def rearrange(file_path)
		file = File.open(file_path, 'w')
		current = trigramerator.seed
		file.write(current)
		loop do
			next_word = trigramerator.value_for(current)
			next_word.nil? ? break : file.write(' ' + next_word)
			current = StringTokenizer.last_two_words(current + ' ' + next_word)
		end
		file.close
	end
end
