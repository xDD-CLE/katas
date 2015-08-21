class Adder

  ADDITION = lambda {|addend,sum| sum += addend }
  NEGATIVE_NUMBER = lambda {|num| num < 0}
  
  def self.add(string_of_addends)
    return 0 if string_of_addends.empty?
    addends = normalize(string_of_addends)

    addends_as_numbers = addends.map(&:to_i)

    raise ArgumentError.new if addends_as_numbers.any?(&NEGATIVE_NUMBER)

    addends_as_numbers.inject(0, &ADDITION)
  end

  def self.normalize(string_of_addends)
    delimiters = /[,\n]/

    if string_of_addends[0..1] == "//"
      delimiter_override = string_of_addends[2]
      string_of_addends.slice!(0..2)
      string_of_addends.tr!(delimiter_override, ',')
    end
    string_of_addends.split(delimiters)
  end

end
