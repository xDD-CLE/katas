class StringCalculator
  def initialize(value = 0)
    @value = value
  end

  def value
    @value
  end

  def add(string)
    calculate(string, &lambda {|i| @value += i})
    self
  end

  def calculate(string, &calculation)
    ints = Tokenizer.new(string).ints
    @negs = ints.select { |i| i<0 }
    calculation.call(ints.inject(:+))
  end

  def subtract(string)
    calculate(string, &lambda {|i| @value -= i})
    self
  end

  def check_negatives
    raise "Negatives not allowed! #{@negs.join(', ')}" if @negs.any?
    self
  end
end