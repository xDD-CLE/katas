module Adder where

add :: String -> Int
add [] = 0
add [x] = error "Unhandled input"