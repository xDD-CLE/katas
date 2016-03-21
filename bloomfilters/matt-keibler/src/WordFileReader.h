#ifndef WORD_FILE_READER_H
#define WORD_FILE_READER_H

#include <string>
#include <vector>

using std::string;
using std::vector;

#define DEFAULT_WORD_FILE "/usr/share/dict/words"

class WordFileReader{
 public:
  WordFileReader();
  WordFileReader(string filename);
  
  const vector<string>& get_words();
  
 private:
  vector<string> words;

  void initialize(string filename);
};

#endif
