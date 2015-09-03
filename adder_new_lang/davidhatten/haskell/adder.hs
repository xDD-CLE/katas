module Adder where
import Data.List.Split

add :: String -> Int
add [] = 0
add (x:[]) = read [x]
add (x) = sum $ map read $ splitOn "," x :: Int