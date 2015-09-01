__author__ = 'david'
import unittest
import adder


class AdderTestCase(unittest.TestCase):
    def test_addNoNumbers(self):
        result = adder.add("")
        self.assertEqual(0, result, "Adding no parameters should result in 0")

    def test_addOneNumber(self):
        result = adder.add("2")
        self.assertEqual(2, result, "Two and zero should be 2")

    def test_addTwoNumbers(self):
        result = adder.add("2, 2")
        self.assertEqual(4, result, "Two and Two should be 4")

    def test_addManyNumbers(self):
        result = adder.add("2, 3, 4")
        self.assertEqual(9, result, "Two and Three and Four should be 9")

if __name__ == '__main__':
    unittest.main()