from collections import Counter

class Trigram:
    def __init__(self, input_text=''):
        self.input_text = input_text
        self.map = {}

    def parse(self):
        words = self.input_text.split(' ')
        if len(words) < 3:
            raise ValueError('Input text must be at least 3 words in length')
        self.map = {}
        for i in xrange(len(words) - 2):
            current_bigram = words[i] + ' ' + words[i+1]
            if not self.map.has_key(current_bigram):
                self.map[current_bigram] = Counter()
            self.map[current_bigram][words[i+2]] += 1