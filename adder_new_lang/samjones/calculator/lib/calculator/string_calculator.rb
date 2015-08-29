class StringCalculator
  def initialize(value = 0)
    @value = value
  end

  def value
    @value
  end

  def add(string)
    @value += Tokenizer.new(string).ints.inject(:+)
    self
  end

  def subtract(string)
    @value -= Tokenizer.new(string).ints.inject(:+)
    self
  end
end