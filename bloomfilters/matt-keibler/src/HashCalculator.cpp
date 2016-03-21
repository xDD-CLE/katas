#include "HashCalculator.h"

Hash HashCalculator::calculate(string word){
  Hash hash;
  hash.full_hash = hash_function(word);
  
  return hash;
}
