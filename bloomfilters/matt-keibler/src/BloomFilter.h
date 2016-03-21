#ifndef BLOOM_FILTER_H
#define BLOOM_FILTER_H

#include "HashCalculator.h"

#include <string>
#include <vector>
#include <bitset>
#include <limits.h>

using std::string;
using std::vector;
using std::bitset;

class BloomFilter{
 public:
  BloomFilter(HashCalculator* hash_calculator, vector<string> initial_words);
  ~BloomFilter();

  bool validate_word(string word);

 private:
  bitset<UINT_MAX + 1ul>* bloom;
  HashCalculator* hash_calculator;
};

#endif
