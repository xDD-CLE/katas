(ns langton.prerenderer-test
  (:use midje.sweet)
  (:use [langton.prerenderer]))

(def world {:ant {:pos [0 0] :faces :north}
            :grid {0 {0 :white
                      1 :black}
                   1 {0 :black
                      1 :white}}})

(facts "about turning the world to cells"
  (fact "it returns an array of arrays of renderable cells"
    (world->cells world) => [[{:color :white :ant :north} {:color :black}]
                             [{:color :black} {:color :white}]]))
