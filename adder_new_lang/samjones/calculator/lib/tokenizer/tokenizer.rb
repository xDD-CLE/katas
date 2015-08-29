
class Tokenizer
  def initialize(string = '')
    @string = string
  end

  def tokens
    @string.split(/[,|\n]/)
  end

  def ints
    tokens.select{|s| is_i?(s)}.map{|s| s.to_i}
  end

  def is_i?(string)
    string.to_i.to_s == string
  end

end