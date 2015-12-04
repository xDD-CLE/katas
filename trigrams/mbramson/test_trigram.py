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

    def test_trigram_constructor_instantiates_empty_trigram_map_dict(self):
        trigram = Trigram()
        self.assertEqual(trigram.map, {})

    # parse() tests
    def test_parse_makes_trigram_map_a_dictionary(self):
        trigram = Trigram('the quick brown fox jumped over the fence')
        trigram.parse()
        self.assertIsInstance(trigram.map, dict)

    def test_parse_raises_error_if_text_has_less_than_three_words(self):
        trigram = Trigram('two words')
        self.assertRaises(ValueError, trigram.parse)

    def test_parse_adds_dictionary_entry_of_first_two_words(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        self.assertEqual('three whole', trigram.map.keys()[0])

    def test_parse_return_dict_values_are_counters(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        self.assertIsInstance(trigram.map['three whole'], Counter)

    def test_parse_return_dict_has_second_bigram_as_key(self):
        trigram = Trigram('four whole real words')
        trigram.parse()
        self.assertIsInstance(trigram.map['whole real'], Counter)

    def test_parse_return_dict_value_counters_increment_to_1(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        self.assertEqual(1, trigram.map['three whole']['words'])

    def test_parse_return_dict_value_counters_increment_to_2(self):
        trigram = Trigram('three whole words and three whole words')
        trigram.parse()
        self.assertEqual(2, trigram.map['three whole']['words'])

    def test_running_parse_twice_with_append_map_true_double_counts(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        trigram.parse(append_map=True)
        self.assertEqual(2, trigram.map['three whole']['words'])

    # predict_next_word tests
    def test_predict_next_word_returns_string(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        next_word = trigram.predict_next_word(bigram = 'three whole')
        self.assertIsInstance(next_word, str)

    def test_predict_next_word_errors_if_no_map(self):
        trigram = Trigram()
        self.assertRaises(ValueError, trigram.predict_next_word, 'anything')

    def test_predict_next_word_returns_third_word_for_trigram_input(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        next_word = trigram.predict_next_word(bigram = 'three whole')
        self.assertEqual('words', next_word)

    def test_predict_next_word_returns_only_possible_answer_for_longer_corpus(self):
        trigram = Trigram('three whole words are not enough to properly test '
                          'this method so how about fifteen')
        trigram.parse()
        next_word = trigram.predict_next_word(bigram = 'enough to')
        self.assertEqual('properly', next_word)

    # get_next_word_array tests
    def test_get_next_word_list_returns_list(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        next_word_list = trigram.get_next_word_list(bigram = 'three whole')
        self.assertIsInstance(next_word_list, list)

    def test_get_next_word_array_returns_single_element_list(self):
        trigram = Trigram('three whole words')
        trigram.parse()
        next_word_list = trigram.get_next_word_list(bigram = 'three whole')
        self.assertEqual(['words'], next_word_list)

    def test_get_next_word_array_returns_two_next_word_options(self):
        trigram = Trigram('two words first two words second')
        trigram.parse()
        next_word_list = trigram.get_next_word_list(bigram = 'two words')
        self.assertEqual(['first', 'second'], next_word_list)
