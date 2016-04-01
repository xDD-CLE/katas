#include <gtest/gtest.h>
#include "../src/BloomFilter.h"
#include "MockHashCalculator.h"

#include <functional>
using std::hash;

#include <iostream>
using std::cout;

TEST(BloomFilter, TestNullCalculator){
  vector<string> test_words;
  test_words.push_back("word");
  BloomFilter bloom_filter(NULL, test_words);
  EXPECT_FALSE(bloom_filter.validate_word("word"));
}

TEST(BloomFilter, TestWithRealCalculator){
  HashCalculator* calc = new HashCalculator();
  vector<string> test_words;
  test_words.push_back("word");
  BloomFilter bloom_filter(calc, test_words);
  EXPECT_TRUE(bloom_filter.validate_word("word"));
  EXPECT_FALSE(bloom_filter.validate_word("invalid"));
}

TEST(BloomFilter, TestBoundariesWithMockCalculator){
  MockHashCalculator* calc = new MockHashCalculator();

  Hash hash;
  hash.split_hash[0] = 0;
  hash.split_hash[1] = UINT_MAX;
  calc->add_verify_and_return("word", hash);

  vector<string> test_words;
  test_words.push_back("word");
  BloomFilter bloom_filter(calc, test_words);
  EXPECT_TRUE(calc->verify_calls());
}
