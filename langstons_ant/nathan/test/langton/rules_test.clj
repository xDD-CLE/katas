(ns langton.rules-test
  (:use midje.sweet
        [langton.rules]))

(facts "about advancing colors"
  (next-color :white) => :black
  (next-color :black) => :white)

(facts "about turning"
  (fact "when on a white square, the ant turns right"
    (take 5 (iterate #(next-direction % :white) :north))
      => [:north :east :south :west :north])

  (fact "when on a black square, the ant turns left"
    (take 5 (iterate #(next-direction % :black) :north))
      => [:north :west :south :east :north]))
