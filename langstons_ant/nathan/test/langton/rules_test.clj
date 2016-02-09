(ns langton.rules-test
  (:use midje.sweet
        [langton.rules]))

(facts "about setting the rules"
  (fact "it creates rule sets from the left/right direction instructions"
    (set-rules! "L")    => {:white {:next-color :white :turn dec}}
    (set-rules! "R")    => {:white {:next-color :white :turn inc}}
    (set-rules! "RL")   => {:white {:next-color :grey  :turn inc}
                            :grey  {:next-color :white :turn dec}}
    (set-rules! "LLRR") => {:white {:next-color :grey  :turn dec}
                            :grey  {:next-color :green :turn dec}
                            :green {:next-color :blue  :turn inc}
                            :blue  {:next-color :white :turn inc}}
    (set-rules! "LRRRRRLLR") => {:white   {:next-color :grey    :turn dec}
                                 :grey    {:next-color :green   :turn inc}
                                 :green   {:next-color :blue    :turn inc}
                                 :blue    {:next-color :red     :turn inc}
                                 :red     {:next-color :yellow  :turn inc}
                                 :yellow  {:next-color :magenta :turn inc}
                                 :magenta {:next-color :cyan    :turn dec}
                                 :cyan    {:next-color :black   :turn dec}
                                 :black   {:next-color :white   :turn inc}}))

(set-rules! "LRL")
(facts "about advancing colors"
  (next-color :white) => :grey
  (next-color :grey)  => :green
  (next-color :green) => :white)

(set-rules! "RL")
(facts "about turning"
  (fact "the ant turns in the direction dictated by the rules"
    (take 5 (iterate #(next-direction % :white) :north))
      => [:north :east :south :west :north]
    (take 5 (iterate #(next-direction % :grey) :north))
      => [:north :west :south :east :north])

  (fact "it raises an error if the given color is not in the current rule-set"
    (next-direction :north :black) => (throws java.lang.AssertionError)))
