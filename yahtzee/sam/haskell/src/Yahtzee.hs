module Yahtzee (
                scoreOnes
              , scoreTwos
              , scoreThrees
              , scoreFours
              , scoreFives
              , scoreSixes
              , scoreThreeOfAKind
              , scoreFourOfAKind
              , scoreFullHouse) where

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

scoreOrZero :: Score -> ([Int] -> Bool) -> Score
scoreOrZero scoreFun predicate dice = if predicate dice
                                      then scoreFun dice
                                      else 0

sumOrZero = scoreOrZero sum


diceCountGt kind = any ((>= kind).snd)
hasKind kind = (diceCountGt kind).diceCounts

scoreThreeOfAKind :: Score
scoreThreeOfAKind = sumOrZero (hasKind 3)

scoreFourOfAKind :: Score
scoreFourOfAKind = sumOrZero (hasKind 4)



hasPairAndTriple = (isInfixOf [2,3]).(map snd)

scoreFullHouse :: Score
scoreFullHouse = scoreOrZero (\_ -> 25) (hasPairAndTriple.diceCounts)
