
class Tokenizer
  def tokens(string)
    case string
      when /\/\/(.)\n(.*)/
        delims = $1
        string = $2
      when /\/\/(\[.+\])+\n.*/
        delims = Regexp.new($1.split(/\[|\]/).reject(&:empty?).join('|'))
        string = string.sub(/\/\/(\[.+\])+\n/, '')
      else
        delims = /,|\n/
        string = string
    end
    string.split(delims)
  end

  def ints(string = '')
    tokens(string).select{|s| is_i?(s)}.map{|s| s.to_i}
  end

  def is_i?(string)
    string.to_i.to_s == string
  end

end