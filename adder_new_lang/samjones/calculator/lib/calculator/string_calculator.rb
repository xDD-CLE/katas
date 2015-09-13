require 'tokenizer/tokenizer'

class StringCalculator
  include Tokenizer
  def initialize(value = 0)
    @value = value
  end

  def value
    @value
  end

  def add(string)
    check_negatives(string)
    @value += sum_ints(string)
    self
  end

  def sum_ints(string)
    ints(string).inject(:+)
  end


  def subtract(string)
    @value -= sum_ints(string)
    self
  end

  def check_negatives(string)
    negs = ints(string).select { |i| i<0 }
    raise "Negatives not allowed! #{negs.join(', ')}" if negs.any?
    self
  end
end