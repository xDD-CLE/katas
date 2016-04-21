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

type Die = Int
type Roll = [Die]
type Score = Roll -> Int

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




diceCounts :: Roll -> [(Die, Int)]
diceCounts dice = [(head g, length g) | g <- groupBy (==) dice]

scoreOrZero :: Score -> (Roll -> Bool) -> Score
scoreOrZero scoreFun predicate dice = if predicate dice
                                      then scoreFun dice
                                      else 0

sumOrZero :: (Roll -> Bool) -> Score
sumOrZero = scoreOrZero sum


hasKind :: Int -> Roll -> Bool
hasKind kind = (diceCountGt kind).diceCounts
  where 
   diceCountGt kind = any ((>= kind).snd)

scoreThreeOfAKind :: Score
scoreThreeOfAKind = sumOrZero (hasKind 3)

scoreFourOfAKind :: Score
scoreFourOfAKind = sumOrZero (hasKind 4)


always :: a -> b -> a
always val = (\_ -> val)

scoreFullHouse :: Score
scoreFullHouse = scoreOrZero (always 25) (hasPairAndTriple.diceCounts)
  where
    hasPairAndTriple = (isInfixOf [2,3]).(map snd)


scoreSmallStraight :: Score
scoreSmallStraight = scoreOrZero (always 30) (== [1..5])

scoreLargeStraight :: Score
scoreLargeStraight = scoreOrZero (always 40) (== [2..6])

scoreYahtzee :: Score
scoreYahtzee = scoreOrZero (always 50) allEqual
  where
    allEqual dice = all (== head dice) dice


scoreChance :: Score
scoreChance = sum
