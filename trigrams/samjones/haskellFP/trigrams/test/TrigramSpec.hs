module TrigramSpec (main, spec) where

import Test.Hspec

import Trigrams

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "trigrams" $ do
    it "should calculate the trigrams for 'I wish I may I wish I might'" $ do
      trigrams "I wish I may I wish I might" `shouldBe` [("I wish", ["I", "I"]),
                                                        ("wish I", ["may", "might"]),
                                                        ("may I", ["wish"]),
                                                        ("I may", ["I"])]
