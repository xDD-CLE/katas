__author__ = 'david'
import unittest

from python import adder


class AdderTestCase(unittest.TestCase):
    def setUp(self):
        self.add = adder.Adder().add

    def test_addNoNumbers(self):
        result = self.add('')
        self.assertEqual(0, result, 'Adding no parameters should result in 0')

    def test_addOneNumber(self):
        result = self.add('2')
        self.assertEqual(2, result, 'Two and zero should be 2')

    def test_addTwoNumbers(self):
        result = self.add('2,2')
        self.assertEqual(4, result, 'Two and Two should be 4')

    def test_addManyNumbers(self):
        result = self.add('2,3,4')
        self.assertEqual(9, result, 'Two and Three and Four should be 9')

    def test_newlineDelimiter(self):
        result = self.add('2\n2')
        self.assertEqual(4, result, 'Two plus Two with newline delimiter')

        result = self.add('3,3\n3')
        self.assertEqual(9, result, 'Three plus three plus three with both delimiters')

    def test_customDelimiter(self):
        result = self.add('//;\n3;3')
        self.assertEqual(6, result, 'Three plus three with a custom delimiter should be 6')

        result = self.add('//;\n3;3,2\n1')
        self.assertEqual(9, result, 'Three plus three plus two plus one with custom and default delimiters should be 9')

    def test_negativeNumbersException(self):
        expression = '-3,3,-2'
        self.assertRaises(RuntimeError, self.add, expression)
        try:
            self.add(expression)
        except RuntimeError as e:
            self.assertEqual('Negative input not allowed: -3, -2', e.args[0], 'Negative numbers should be printed in the exception')


if __name__ == '__main__':
    unittest.main()