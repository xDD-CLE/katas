(ns langton.core-test
  (:use midje.sweet
        [langton.core]))

(facts "about running the simulation"
  (let [simulate (fn [rule-set iterations]
                   (let [rendered-screen (atom [])
                         fake-renderer (partial reset! rendered-screen)]
                     (run-simulation fake-renderer rule-set iterations 0)
                     @rendered-screen))]

    (fact "it sets the rules according to the given string and renders the results"
      (simulate "RL" 0) => []
      (simulate "RL" 1) => [[{:color :white :ant :west}]]
      (simulate "RL" 2) => [[{:color :white :ant :north}]
                            [{:color :grey}]]
      (simulate "LR" 2) => [[{:color :grey}]
                            [{:color :white :ant :south}]])))
