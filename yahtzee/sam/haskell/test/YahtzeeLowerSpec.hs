module YahtzeeLowerSpec (
                          spec) where

import Test.Hspec

import Yahtzee (
                scoreThreeOfAKind
              , scoreFourOfAKind)

spec :: Spec
spec = do
  describe "Yahtzee! Score Lower" $ do
    it "should score 3 of a kind" $ do
      scoreThreeOfAKind [2,2,2,3,4] `shouldBe` 13
    it "should score no 3 of a kind" $ do
      scoreThreeOfAKind [2,2,3,4,5] `shouldBe` 0

    it "should score 4 of a kind" $ do
      scoreFourOfAKind [2,2,2,2,4] `shouldBe` 12
    it "should score no 4 of a kind" $ do
      scoreFourOfAKind [2,2,2,3,4] `shouldBe` 0
