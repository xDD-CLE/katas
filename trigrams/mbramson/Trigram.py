from collections import Counter

class Trigram:
    def __init__(self, input_text=''):
        self.input_text = input_text

    def parse(self):
        words = self.input_text.split(' ')
        if len(words) < 3:
            raise ValueError('Input text must be at least 3 words in length')
        return_dict = {}
        for i in xrange(len(words) - 2):
            current_bigram = words[i] + ' ' + words[i+1]
            if not return_dict.has_key(current_bigram):
                return_dict[current_bigram] = Counter()
            return_dict[current_bigram][words[i+2]] += 1
        return return_dict