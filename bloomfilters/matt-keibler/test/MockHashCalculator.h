#ifndef MOCK_HASH_CALCULATOR_H
#define MOCK_HASH_CALCULATOR_H

#include "../src/HashCalculator.h"

#include <queue>
using std::queue;

class MockHashCalculator : public HashCalculator {
 public:

  MockHashCalculator();
  
  Hash calculate(string word);

  void add_verify_and_return(string word, Hash hash);
  bool verify_calls();

 private:
  queue<string> to_hash;
  queue<Hash> to_return;
  bool failed;
};

#endif
