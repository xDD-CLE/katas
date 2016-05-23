module Trigrams (trigrams) where

import qualified Data.Map as Map

type Trigrams = Map.Map String [String]

trigrams :: String -> Trigrams
trigrams = foldl insertVal Map.empty . fmap createTrigram . splitWordsIntoThree
  where
    insertVal acc (k, v) = Map.insertWith (++) k v acc 

splitWordsIntoThree :: String -> [[String]]
splitWordsIntoThree = undefined

createTrigram :: [String] -> (String, [String])
createTrigram = undefined
