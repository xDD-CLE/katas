from collections import Counter
import os.path

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

    def generate_text(self, start_text, max_words=5):
        bigram_array = start_text.split(' ')
        if len(bigram_array) < 2:
            raise ValueError('start_text must be 2 words separated by a space')
        word_num = 0
        while word_num < (max_words - 2):
            bigram = bigram_array[word_num] + ' ' + bigram_array[word_num + 1]
            try:
                bigram_array.append(self.predict_next_word(bigram=bigram))
                word_num += 1
            except KeyError: # don't know the next word. bigram not in self.map
                break
        return ' '.join(bigram_array)

    def load_from_file(self, filename):
        if not os.path.exists(filename):
            raise IOError('filename not found')
        with open(filename) as f:
            self.input_text = f.read()
