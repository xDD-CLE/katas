#include "BloomFilter.h"

BloomFilter::BloomFilter(HashCalculator* hash_calculator_, vector<string> initial_words) : hash_calculator(hash_calculator_) {
  bloom = new bitset<M_CONSTANT>();
  if(hash_calculator){
    for(string word : initial_words){
      Hash calculated_hash = hash_calculator->calculate(word);
      bloom->set(calculated_hash.split_hash[0]);
      bloom->set(calculated_hash.split_hash[1]);
    }
  }
}

BloomFilter::~BloomFilter(){
  delete hash_calculator;
  hash_calculator = 0;

  delete bloom;
  bloom = 0;
}

bool BloomFilter::validate_word(string word){
  if(hash_calculator){
    Hash calculated_hash = hash_calculator->calculate(word);
    return bloom->test(calculated_hash.split_hash[0])
      && bloom->test(calculated_hash.split_hash[1]);
  }
  return false;
}
