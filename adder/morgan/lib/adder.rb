class Adder

  def self.add(addends)
    return 0 if addends == ""
    addends.split(',').map(&:to_i).inject(0){|addend,sum| sum += addend  }
  end
end
