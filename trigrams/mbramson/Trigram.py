from collections import Counter

class Trigram:
    def __init__(self, input_text=''):
        self.input_text = input_text

    def parse(self):
        words = self.input_text.split(' ')
        if len(words) < 3:
            raise ValueError('Input text must be at least 3 words in length')
        return Counter()