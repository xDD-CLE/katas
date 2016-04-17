module YahtzeeLowerSpec (
                          spec) where

import Test.Hspec

import Yahtzee (
                scoreThreeOfAKind)

spec :: Spec
spec = do
  describe "Yahtzee! Score Lower" $ do
    it "should score 3 of a kind" $ do
      scoreThreeOfAKind [2,2,2,3,4] `shouldBe` 13
    it "should score no 3 of a kind" $ do
      scoreThreeOfAKind [2,2,3,4,5] `shouldBe` 0
