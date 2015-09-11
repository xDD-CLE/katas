from calculators.string_calculator import Calculator

import unittest


class StringCalculator(unittest.TestCase):

    def test_that_it_returns_0_for_an_empty_string(self):
        assert Calculator("").add() == ""
        self.assertEquals(Calculator("").add(), "")

    def test_that_it_returns_the_same_number_when_only_provided_one_number(self):
        self.assertEquals(Calculator("1").add(), 1)

    def test_that_it_adds_two_numbers(self):
        self.assertEquals(Calculator("1,2").add(), 3)

    def test_that_it_adds_a_heck_of_a_lot_of_numbers(self):
        expected_sum_of_1_to_100 = 4950
        numbers = ",".join(map(lambda num: str(num), range(1, 100)))
        actual = Calculator(numbers).add()
        self.assertEquals(expected_sum_of_1_to_100, actual)

    def test_that_it_handles_new_lines_as_delimiters(self):
        self.assertEquals(Calculator("1\n2,3").add(), 6)

    def test_that_it_supports_different_delimiters(self):
        self.assertEquals(Calculator("//;\n1;2").add(), 3)
