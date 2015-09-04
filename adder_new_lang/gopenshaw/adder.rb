require 'minitest/spec'
require 'minitest/autorun'

class Adder

	def self.add(input)
        positives, negatives = get_numbers(input)
        if (negatives.empty?)
            return sum_numbers(positives)
        else
            return Exception.new(get_error_message(negatives))
        end
	end

    def self.get_error_message(negatives)
        message = "negatives not allowed";
        negatives.each do |number|
            message += " " + number.to_s
        end
        
        return message
    end
    
    def self.sum_numbers(numbers)
        sum = 0
		numbers.each do |number|
            value = Integer(number)
            if (value <= 1000)
                sum += Integer(number)
            end
		end

        return sum
    end

    def self.get_numbers(input)
        positives = Array.new
        negatives = Array.new
        parse(input).each do |number|
            value = Integer(number)
            if (value < 0)
                negatives << value
            else
                positives << value
            end
        end

        return positives, negatives
    end

	def self.parse(input)
		if (input[0,2] == "//")
            delimiter_length = input.index("\n") - 2
			delimiter = input[2, delimiter_length]
            values = input[2 + delimiter_length, input.length]
			return values.split(delimiter)
		end

		return input.split(%r',|\n')
	end
end

class AdderTests < MiniTest::Unit::TestCase

	def test_sum_of_no_numbers_is_zero
		assert_equal 0, Adder.add("")
	end

	def test_a_single_number_is_itself
		assert_equal 1, Adder.add("1")
	end

	def test_it_sums_two_numbers
		assert_equal 21, Adder.add("5,16")
	end

	def test_it_sums_many_numbers
		assert_equal 39, Adder.add("5,16,12,1,5")
	end

	def test_numbers_separated_by_newlines
		assert_equal 6, Adder.add("1\n2,3")
	end

	def test_supports_custom_delimiters
		assert_equal 8, Adder.add("//;\n1;5;2")
	end

	def test_it_throws_an_exception_for_negative_numbers
        result = Adder.add("5,-1")
        assert result.is_a?(Exception)
	end

	def test_exception_has_descriptive_message
        result = Adder.add("5,-1,-15")
        assert_equal "negatives not allowed -1 -15", result.message
	end

	def test_it_ignores_numbers_greater_than_1000
        result = Adder.add("1000,1001,5")
        assert_equal 1005, result
	end

	def test_supports_custom_delimiters_of_any_length
		assert_equal 8, Adder.add("//***\n1***5***2")
	end
end
