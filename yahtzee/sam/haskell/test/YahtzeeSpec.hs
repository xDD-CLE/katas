module YahtzeeSpec (
                    spec) where

import Test.Hspec

spec :: Spec
spec = do
  describe "The world" $ do
    it "exists" $ do
      True `shouldBe` True
