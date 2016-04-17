module Yahtzee (
                scoreOnes
              , scoreTwos
              , scoreThrees
              , scoreFours
              , scoreFives
              , scoreSixes
              , scoreThreeOfAKind
              , scoreFourOfAKind
              , scoreFullHouse
              , scoreSmallStraight
              , scoreLargeStraight
              , scoreYahtzee
              , scoreChance) where

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



always val = (\_ -> val)
hasPairAndTriple = (isInfixOf [2,3]).(map snd)

scoreFullHouse :: Score
scoreFullHouse = scoreOrZero (always 25) (hasPairAndTriple.diceCounts)


scoreSmallStraight :: Score
scoreSmallStraight = scoreOrZero (always 30) (== [1..5])

scoreLargeStraight :: Score
scoreLargeStraight = scoreOrZero (always 40) (== [2..6])

allEqual dice = all (== head dice) dice
scoreYahtzee :: Score
scoreYahtzee = scoreOrZero (always 50) allEqual


scoreChance :: Score
scoreChance = sum
