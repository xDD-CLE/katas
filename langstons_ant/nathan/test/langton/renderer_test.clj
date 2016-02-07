(ns langton.renderer-test
  (:use midje.sweet
        [langton.renderer]
        [langton.rules :refer [set-rules!]])
  (:require [clojure.term.colors :refer :all]))

(set-rules! "RL")

(def cells [[{:color :white :ant :north} {:color :grey}]
            [{:color :grey} {:color :white}]])

(facts "about turning the cells to a string"
  (fact "it returns a string representation of the cells"
    (cells->string cells) => (str (on-white (red (bold "^")) (red (bold "^")))
                                  (on-grey  " " " ")
                                  "\n"
                                  (on-grey  " " " ")
                                  (on-white " " " "))))
