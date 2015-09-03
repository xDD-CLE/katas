module Adder where
import Data.List.Split

delimiters = ",\n"

add :: String -> Int
add [] = 0
add (x:[]) = read [x]
add (x) = sum $ map read $ splitOneOf delimiters x :: Int