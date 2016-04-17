module YahtzeeLowerSpec (
                          spec) where

import Test.Hspec

import Yahtzee (
                scoreThreeOfAKind
              , scoreFourOfAKind
              , scoreFullHouse
              , scoreSmallStraight
              , scoreLargeStraight
              , scoreYahtzee
              , scoreChance)

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

    it "should score full house" $ do
      scoreFullHouse [2,2,3,3,3] `shouldBe` 25
    it "should score no full house" $ do
      scoreFullHouse [2,2,3,3,4] `shouldBe` 0

    it "should score small straight" $ do
      scoreSmallStraight [1,2,3,4,5] `shouldBe` 30
    it "should score no small straight" $ do
      scoreSmallStraight [1,1,2,2,3] `shouldBe` 0

    it "should score large straight" $ do
      scoreLargeStraight [2,3,4,5,6] `shouldBe` 40
    it "should score no large straight" $ do
      scoreLargeStraight [1,1,2,2,3] `shouldBe` 0

    it "should score Yahtzee!" $ do
      scoreYahtzee [2,2,2,2,2] `shouldBe` 50
    it "should score no Yahtzee!" $ do
      scoreYahtzee [1,2,3,4,5] `shouldBe` 0

    it "should score chance" $ do
      scoreChance [1,2,3,2,3] `shouldBe` 11
