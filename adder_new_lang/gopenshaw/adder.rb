require 'neo'

class Adder < Neo::Koan
	def add(input)
		numbers = input.split(',')
		sum = 0
		numbers.each do |number|
			sum += Integer(number)
		end
		return sum
	end

	def test_sum_of_no_numbers_is_zero
		assert_equal 0, add("")
	end

	def test_a_single_number_is_itself
		assert_equal 1, add("1")
	end

	def test_it_sums_two_numbers
		assert_equal 21, add("5,16")
	end
end
