import unittest
from collections import Counter
from Trigram import Trigram


class Test_Trigram(unittest.TestCase):

    #Class Tests
    def test_trigram_constructor_saves_input_text(self):
        text = 'the quick brown fox jumped over the fence'
        trigram = Trigram('the quick brown fox jumped over the fence')
        self.assertEqual(trigram.input_text, text)

    def test_trigram_constructor_default_is_empty_string(self):
        trigram = Trigram()
        self.assertEqual(trigram.input_text, '')

    def test_parse_returns_counter(self):
        trigram = Trigram('the quick brown fox jumped over the fence')
        self.assertIsInstance(trigram.parse(), Counter)

    def test_parse_raises_error_if_text_has_less_than_three_words(self):
        trigram = Trigram('two words')
        self.assertRaises(ValueError, trigram.parse)