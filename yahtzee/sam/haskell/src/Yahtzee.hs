module Yahtzee (
                scoreOnes
              , scoreTwos
              , scoreThrees
              , scoreFours
              , scoreFives
              , scoreSixes) where

scoreUpper :: Int -> [Int] -> Int
scoreUpper num = sum . filter (==num)

scoreOnes = scoreUpper 1
scoreTwos = scoreUpper 2
scoreThrees = scoreUpper 3
scoreFours = scoreUpper 4
scoreFives = scoreUpper 5
scoreSixes = scoreUpper 6
