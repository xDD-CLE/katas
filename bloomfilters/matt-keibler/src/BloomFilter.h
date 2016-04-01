#ifndef BLOOM_FILTER_H
#define BLOOM_FILTER_H

#include "HashCalculator.h"

#include <string>
#include <vector>
#include <bitset>

using std::string;
using std::vector;
using std::bitset;

class BloomFilter{
 public:
  BloomFilter(HashCalculator* hash_calculator, vector<string> initial_words);
  ~BloomFilter();

  bool validate_word(string word);

 private:
  bitset<M_CONSTANT>* bloom;
  HashCalculator* hash_calculator;
};

#endif
