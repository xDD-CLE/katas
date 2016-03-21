#include "BloomFilter.h"
#include "HashCalculator.h"
#include "WordFileReader.h"

#include <iostream>
using std::cin;
using std::cout;

int main(){
  WordFileReader reader;

  BloomFilter filter(new HashCalculator(), reader.get_words());

  string word;
  do{
    cout << "Enter a word to check [exit to quit]: ";
    cin >> word;

    bool valid = filter.validate_word(word);
    cout << "[" << word << "] -> " << (valid ? "correct" : "incorrect") << "\n";

  } while ("exit" != word);
}
