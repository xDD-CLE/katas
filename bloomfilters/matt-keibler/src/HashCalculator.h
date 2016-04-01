#ifndef HASH_CALCULATOR_H
#define HASH_CALCULATOR_H

#include <limits.h>

#define HASH_TYPE unsigned long int
#define HASH_SIZE sizeof(HASH_TYPE)
#define M_TYPE unsigned int
#define M_SIZE sizeof(M_TYPE)
#define M_CONSTANT UINT_MAX + 1ul
#define K_CONSTANT (HASH_SIZE / M_SIZE)

#include <functional>
using std::hash;

#include <string>
using std::string;

union Hash {
  HASH_TYPE full_hash;
  M_TYPE split_hash[K_CONSTANT];
};

class HashCalculator{
 public:
  virtual Hash calculate(string word);

 private:
  hash<string> hash_function;
};

#endif
