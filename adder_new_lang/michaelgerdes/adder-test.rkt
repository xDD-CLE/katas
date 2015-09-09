#lang racket/base

(require rackunit
         "adder.rkt")

(check-equal? (adder "") 0 "It works with the empty string")
(check-equal? (adder "1") 1 "It works with a single number")
(check-equal? (adder "1,2") 3 "It works with two numbers")
(check-equal? (adder "1,2,3") 6 "It works with three numbers")
(check-equal? (adder "1,2,3,4,5,6,7,8,9,10") (+ 1 2 3 4 5 6 7 8 9 10) "It works with lots of numbers")
(check-equal? (adder "2,5,9") 16 "It still works when not adding consecutive numbers.")
(check-equal? (adder "2\n5,9") 16 "It don't care if a newline is a delimiter.")
(check-equal? (adder "//:2\n5,9:8") 24 "It don't care if you define your own delimiter.")
(check-equal? (adder "//252525") 15 "Even a number can be a delimiter.")
