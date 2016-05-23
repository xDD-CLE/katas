module TrigramSpec (main, spec) where

import Test.Hspec

import qualified Data.Map as Map


import Trigrams

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "trigrams" $ do
    it "should calculate the trigrams for 'I wish I may I wish I might'" $ do
      trigrams "I wish I may I wish I might" `shouldBe` Map.fromList [("I wish", ["I", "I"]),
                                                        ("wish I", ["may", "might"]),
                                                        ("may I", ["wish"]),
                                                        ("I may", ["I"])]
