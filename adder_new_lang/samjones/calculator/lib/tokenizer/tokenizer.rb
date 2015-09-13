module Tokenizer
  def initialize
    @regex_or = '|'

    @standard_delimiter = /,|\n/

    @has_single_delimiter = /\/\/(.)\n(.*)/

    @has_multi_delimiter = /\/\/(\[.+\])+\n.*/
    @multi_delimiter = /\[|\]/
    @multi_delimiter_replace = /\/\/(\[.+\])+\n/
  end

  def tokens(string)
    case string
      when @has_single_delimiter
        delims = $1
        string = $2
      when @has_multi_delimiter
        delims = Regexp.new($1.split(@multi_delimiter).reject(&:empty?).join(@regex_or))
        string = string.sub(@multi_delimiter_replace, '')
      else
        delims = @standard_delimiter
        string = string
    end
    string.split(delims)
  end

  def ints(string = '')
    tokens(string).select { |s| is_i?(s) }.map { |s| s.to_i }
  end

  def is_i?(string)
    string.to_i.to_s == string
  end

end