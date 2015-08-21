class Adder

  ADDITION = lambda {|addend,sum| sum += addend }
  NEGATIVE_NUMBER = lambda {|num| num < 0}

  def add(string_of_addends)
    return 0 if string_of_addends.empty?
    addends = normalize(string_of_addends)
    do_not_allow_negative_numbers(addends)
    addends.inject(0, &ADDITION)
  end

  private

  def normalize(addends)
    delimiters = /[,\n]/
    if addends[0..1] == "//"
      delimiter_override = addends[2]
      addends.slice!(0..2)
      addends.tr!(delimiter_override, ',')
    end
    addends.split(delimiters).map(&:to_i)
  end

  def do_not_allow_negative_numbers(addends)
    negative_addends = addends.select(&NEGATIVE_NUMBER)
    raise ArgumentError, negative_number_message(negative_addends) if negative_addends.any?
  end

  def negative_number_message(negative_addends)
    "Negatives not allowed: [#{negative_addends.join(',')}]"
  end

end
