import unittest
from parsers.string_parser import Parser


class StringCalculator(unittest.TestCase):

    def test_that_it_converts_newline_characters_to_commas(self):
        self.assertEquals(Parser().parse("1\n2,3"), "1,2,3")

    def test_that_it_converts_delimiters_to_commas(self):
        self.assertEquals(Parser().parse("//;\n1;2"), "1,2")
