__author__ = 'david'
import unittest
import adder


class AdderTestCase(unittest.TestCase):
    def test_addNoNumbers(self):
        result = adder.add("")
        self.assertEqual(0, result, "Adding no parameters should result in 0")

    def test_addOneNumber(self):
        result = adder.add("2")
        self.assertEqual(2, result)

if __name__ == '__main__':
    unittest.main()