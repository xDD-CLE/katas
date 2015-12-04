import unittest
from collections import Counter
from Trigram import Trigram


class Test_Trigram(unittest.TestCase):

    # Class-wide Tests
    def test_trigram_constructor_saves_input_text(self):
        text = 'the quick brown fox jumped over the fence'
        trigram = Trigram('the quick brown fox jumped over the fence')
        self.assertEqual(trigram.input_text, text)

    def test_trigram_constructor_default_is_empty_string(self):
        trigram = Trigram()
        self.assertEqual(trigram.input_text, '')

    # test parse functionality
    def test_parse_returns_dictionary(self):
        trigram = Trigram('the quick brown fox jumped over the fence')
        self.assertIsInstance(trigram.parse(), dict)

    def test_parse_raises_error_if_text_has_less_than_three_words(self):
        trigram = Trigram('two words')
        self.assertRaises(ValueError, trigram.parse)

    def test_parse_adds_dictionary_entry_of_first_two_words(self):
        trigram = Trigram('three whole words')
        return_dict = trigram.parse()
        self.assertEqual('three whole', return_dict.keys()[0])

    def test_parse_return_dict_values_are_counters(self):
        trigram = Trigram('three whole words')
        self.assertIsInstance(trigram.parse()['three whole'], Counter)

    def test_parse_return_dict_has_second_bigram_as_key(self):
        trigram = Trigram('four whole real words')
        self.assertIsInstance(trigram.parse()['whole real'], Counter)

    def test_parse_return_dict_value_counters_increment_to_1(self):
        trigram = Trigram('three whole words')
        return_dict = trigram.parse()
        self.assertEqual(1, return_dict['three whole']['words'])

    def test_parse_return_dict_value_counters_increment_to_2(self):
        trigram = Trigram('three whole words and three whole words')
        return_dict = trigram.parse()
        self.assertEqual(2, return_dict['three whole']['words'])

