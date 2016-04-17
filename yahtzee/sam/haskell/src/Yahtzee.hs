module Yahtzee (
                scoreOnes
              , scoreTwos
              , scoreThrees
              , scoreFours
              , scoreFives
              , scoreSixes
              , scoreThreeOfAKind) where

import Data.List

type Score = [Int] -> Int

scoreUpper :: Int -> Score
scoreUpper num = sum . filter (==num)

scoreOnes :: Score
scoreOnes = scoreUpper 1

scoreTwos :: Score
scoreTwos = scoreUpper 2

scoreThrees :: Score
scoreThrees = scoreUpper 3

scoreFours :: Score
scoreFours = scoreUpper 4

scoreFives :: Score
scoreFives = scoreUpper 5

scoreSixes :: Score
scoreSixes = scoreUpper 6




diceCounts dice = [(head g, length g) | g <- groupBy (==) dice]
diceCountGt kind = any ((>= kind).snd)

hasKind :: Int -> [Int] -> Bool
hasKind kind = (diceCountGt kind).diceCounts

scoreThreeOfAKind :: Score
scoreThreeOfAKind dice = if hasKind 3 dice
                    then sum dice
                    else 0
