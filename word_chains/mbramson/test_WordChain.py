import unittest
from WordChain import WordChain


class test_WordChain(unittest.TestCase):

    def test_word_chain_class_exists(self):
        self.assertIsInstance(WordChain(), WordChain)