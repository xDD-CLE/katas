module YahtzeeUpperSpec (
                    spec) where

import Test.Hspec

import Yahtzee (
                scoreOnes
              , scoreTwos
              , scoreThrees
              , scoreFours
              , scoreFives
              , scoreSixes)

spec :: Spec
spec = do
  describe "Yahtzee! Upper Score Card" $ do
    it "scores ones" $ do
      scoreOnes [1,1,2,3,4] `shouldBe` 2
    it "scores no ones" $ do
      scoreOnes [2,3,4,5,6] `shouldBe` 0

    it "scores twos" $ do
      scoreTwos [1,2,2,3,4] `shouldBe` 4
    it "scores no twos" $ do
      scoreTwos [1,3,4,5,6] `shouldBe` 0

    it "scores threes" $ do
      scoreThrees [1,2,3,3,4] `shouldBe` 6
    it "scores no threes" $ do
      scoreThrees [1,2,4,5,6] `shouldBe` 0

    it "scores fours" $ do
      scoreFours [1,2,3,4,4] `shouldBe` 8
    it "scores no fours" $ do
      scoreFours [1,2,3,5,6] `shouldBe` 0

    it "scores fives" $ do
      scoreFives [1,2,3,5,5] `shouldBe` 10
    it "scores no fives" $ do
      scoreFives [1,2,3,4,6] `shouldBe` 0

    it "scores sixes" $ do
      scoreSixes [1,2,3,6,6] `shouldBe` 12
    it "scores no sixes" $ do
      scoreSixes [1,2,3,4,5] `shouldBe` 0

