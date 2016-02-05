(ns langton.renderer-test
  (:use midje.sweet)
  (:use [langton.renderer])
  (:require [clojure.term.colors :refer :all]))

(def cells [[{:color :white :ant :north} {:color :black}]
            [{:color :black} {:color :white}]])

(facts "about turning the cells to a string"
  (fact "it returns a string representation of the cells"
    (cells->string cells) => (str (on-white (red (bold "^"))) (on-grey " ") "\n"
                                  (on-grey " ") (on-white " "))))
