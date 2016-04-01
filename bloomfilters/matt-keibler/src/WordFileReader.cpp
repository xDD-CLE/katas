#include "WordFileReader.h"

#include <fstream>
using std::ifstream;

WordFileReader::WordFileReader(){
  initialize(DEFAULT_WORD_FILE);
}

WordFileReader::WordFileReader(string filename){
  initialize(filename);
}

const vector<string>& WordFileReader::get_words(){
  return words;
}

void WordFileReader::initialize(string filename){
  ifstream file(filename);
  if(file.is_open()){
    while(file.good()){
      string word;
      file >> word;
      words.push_back(word);
    }
  }
}
