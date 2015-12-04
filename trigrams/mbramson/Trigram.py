from collections import Counter

class Trigram:
    def __init__(self, input_text=''):
        self.input_text = input_text
        self.map = {}

    def parse(self, append_map=False):
        words = self.input_text.split(' ')
        if len(words) < 3:
            raise ValueError('Input text must be at least 3 words in length')
        if not append_map:
            self.map = {}
        for i in xrange(len(words) - 2):
            current_bigram = words[i] + ' ' + words[i+1]
            if not self.map.has_key(current_bigram):
                self.map[current_bigram] = Counter()
            self.map[current_bigram][words[i+2]] += 1

    def predict_next_word(self, bigram):
        if not self.map:
            raise ValueError('Empty Map. You must parse valid input text first')
        return self.map[bigram].most_common(1)[0][0]
