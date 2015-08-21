class Adder

  ADDITION = lambda {|addend,sum| sum += addend }

  def self.add(string_of_addends)
    return 0 if string_of_addends.empty?
    addends = string_of_addends.split(',')
    addends.map(&:to_i).inject(0, &ADDITION)
  end
end
