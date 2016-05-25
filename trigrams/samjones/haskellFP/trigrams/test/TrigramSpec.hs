module TrigramSpec (main, spec) where

import Test.Hspec

import qualified Data.Map as Map


import Trigrams (trigrams,
                 consecutiveByThree,
                 createTrigram)

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

  describe "Splitting words" $ do
    it "should get consecutive words by three" $ do
      consecutiveByThree "foo bar baz hello" `shouldBe` [["foo", "bar", "baz"], ["bar", "baz", "hello"]]

    it "should get consecutive words by three when less than 3 words" $ do
      consecutiveByThree "foo bar" `shouldBe` []

  describe "Creating a Trigram" $ do
    it "should create trigram from a list of 3 words by making the first two words the key and the last the value" $ do
      createTrigram ["wish", "I", "may"] `shouldBe` ("wish I", ["may"])
