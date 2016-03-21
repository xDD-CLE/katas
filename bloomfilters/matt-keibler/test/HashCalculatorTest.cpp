#include <gtest/gtest.h>
#include "../src/HashCalculator.h"

TEST(HashCalculator, HashesValues){
  HashCalculator calc;
  Hash hash = calc.calculate("word");

  EXPECT_EQ(10029288415951054647u, hash.full_hash);
  EXPECT_EQ(1186195255, hash.split_hash[0]);
  EXPECT_EQ(2335125677, hash.split_hash[1]);

}
