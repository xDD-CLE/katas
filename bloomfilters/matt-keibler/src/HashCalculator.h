#ifndef HASH_CALCULATOR_H
#define HASH_CALCULATOR_H

#include <functional>
using std::hash;

#include <string>
using std::string;

union Hash {
  unsigned long int full_hash;
  unsigned int split_hash[2];
};

class HashCalculator{
 public:
  virtual Hash calculate(string word);

 private:
  hash<string> hash_function;
};

#endif
