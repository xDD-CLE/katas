class Adder

  def add(string_of_addends)
    return 0 if string_of_addends.empty?
    addends = StringNormalizer.to_array_of_integers(string_of_addends)
    raise_error_if_negative_numbers_included_in addends
    exclude_addends_greater_than_or_equal_to_1000(addends)
    sum_up addends
  end

  private

  def raise_error_if_negative_numbers_included_in(addends)
    negative_numbers = lambda {|num| num < 0}
    negative_addends = addends.select(&negative_numbers)
    raise ArgumentError, negative_number_message_with(negative_addends) if negative_addends.any?
  end

  def negative_number_message_with(negative_addends)
    "Negatives not allowed: [#{negative_addends.join(',')}]"
  end

  def exclude_addends_greater_than_or_equal_to_1000(addends)
    greater_than_or_equal_to_1000 = lambda {|addend| addend >= 1000}
    addends.reject!(&greater_than_or_equal_to_1000)
  end

  def sum_up(addends)
    addition = lambda {|addend,sum| sum += addend }
    addends.inject(0, &addition)
  end
end

class StringNormalizer

  DELIMITERS = /[,\n]/

  def self.to_array_of_integers(numbers)
    if numbers[0..1] == "//"
      delimiter_override = numbers[2]
      numbers.slice!(0..2)
      numbers.tr!(delimiter_override, ',')
    end

    numbers.split(DELIMITERS).map(&:to_i)
  end

end
