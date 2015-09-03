require 'neo'

class Adder < Neo::Koan

# Code #

	def add(input)
		numbers = parse(input)
		sum = 0
		numbers.each do |number|
			sum += Integer(number)
		end
		return sum
	end

	def parse(input)
		if (input[0,2] == "//")
			delimiter = input[2, 1]
			return input[4,input.length].split(delimiter)
		end

		return input.split(%r',|\n')
	end

# Tests #

	def test_sum_of_no_numbers_is_zero
		assert_equal 0, add("")
	end

	def test_a_single_number_is_itself
		assert_equal 1, add("1")
	end

	def test_it_sums_two_numbers
		assert_equal 21, add("5,16")
	end

	def test_it_sums_many_numbers
		assert_equal 39, add("5,16,12,1,5")
	end

	def test_numbers_separated_by_newlines
		assert_equal 6, add("1\n2,3")
	end

	def test_supports_custom_delimiters
		assert_equal 8, add("//;\n1;5;2")
	end
end
