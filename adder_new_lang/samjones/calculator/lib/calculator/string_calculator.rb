class StringCalculator
  def initialize(value = 0, tokenizer = Tokenizer.new)
    @value = value
    @tokenizer = tokenizer
  end

  def value
    @value
  end

  def add(string)
    @value += sum_ints(string)
    self
  end

  def sum_ints(string)
    ints = @tokenizer.ints(string)
    @negs = ints.select { |i| i<0 }
    ints.inject(:+)
  end


  def subtract(string)
    @value -= sum_ints(string)
    self
  end

  def check_negatives
    raise "Negatives not allowed! #{@negs.join(', ')}" if @negs.any?
    self
  end
end