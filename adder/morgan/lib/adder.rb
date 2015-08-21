class Adder

  ADDITION = lambda {|addend,sum| sum += addend }
  NEGATIVE_NUMBER = lambda {|num| num < 0}

  def add(string_of_addends)
    return 0 if string_of_addends.empty?
    addends = normalize(string_of_addends)
    raise ArgumentError.new if addends.any?(&NEGATIVE_NUMBER)
    addends.inject(0, &ADDITION)
  end

  private

  def normalize(string_of_addends)
    delimiters = /[,\n]/

    if string_of_addends[0..1] == "//"
      delimiter_override = string_of_addends[2]
      string_of_addends.slice!(0..2)
      string_of_addends.tr!(delimiter_override, ',')
    end
    string_of_addends.split(delimiters).map(&:to_i)
  end

end
