module Adder where
import Data.List.Split

delimiters = ",\n"

add :: String -> Int
add [] = 0
add (x:[]) = read [x]
add ('/':'/':x:y:z) = sumValues $ splitOneOf ([x]++delimiters) z :: Int
add (x) = sumValues $ splitOneOf delimiters x :: Int

sumValues :: [String] -> Int
sumValues (x) = sum $ parseValues x

parseValues :: (Read a) => [String] -> [a]
parseValues x = map read x