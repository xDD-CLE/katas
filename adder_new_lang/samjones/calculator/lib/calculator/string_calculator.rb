class StringCalculator
  def initialize(value = 0)
    @value = value
  end

  def value
    @value
  end

  def add(string)
    @value += string.split(',').map{|s| s.to_i}.inject(:+)
    self
  end

  def subtract(string)
    @value -= string.split(",").map{|s| s.to_i}.inject(:+)
    self
  end
end