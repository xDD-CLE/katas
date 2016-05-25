module Trigrams (trigrams,
               consecutiveByThree,
               createTrigram) where

import qualified Data.Map as Map

type Trigrams = Map.Map String [String]

trigrams :: String -> Trigrams
trigrams = foldl insertVal Map.empty . fmap createTrigram . consecutiveByThree
  where
    insertVal acc (k, v) = Map.insertWith prepend' k v acc 
    prepend' = flip (++)

consecutiveByThree :: String -> [[String]]
consecutiveByThree = takeWhile lenghIsThree  . consecutiveByThree' . words
  where
    consecutiveByThree' [] = [[]]
    consecutiveByThree' xs@(_:rest) = take 3 xs : consecutiveByThree' rest
    lenghIsThree = (==3) . length

createTrigram :: [String] -> (String, [String])
createTrigram [one, two, three] = (unwords [one, two], [three])
createTrigram _ = error "Trigram can only be created from a list of three words"
