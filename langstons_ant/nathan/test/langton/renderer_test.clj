(ns langton.renderer-test
  (:use midje.sweet)
  (:use [langton.renderer])
  (:require [clojure.term.colors :refer :all]))

(def world {:ant {:pos [0 0] :faces :north}
            :grid {0 {0 :white
                      1 :black}
                   1 {0 :black
                      1 :white}}})

(facts "about turning the world to cells"
  (fact "it returns an array of arrays of renderable cells"
    (world->cells world) => [[{:color :white :ant :north} {:color :black}]
                             [{:color :black} {:color :white}]]))

(facts "about turning the world to a string"
  (fact "it returns a string representation of the world"
    (world->string world) => (str (on-white (red (bold "^"))) (on-grey " ") "\n"
                                  (on-grey " ") (on-white " "))))
