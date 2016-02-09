(ns langton.prerenderer-test
  (:use midje.sweet
        [langton.prerenderer]
        [langton.rules :refer [set-rules!]]))

(set-rules! "RL")

(def world {:ant {:pos [0 0] :faces :north}
            :grid {0 {0 :white
                      1 :grey}
                   1 {0 :grey
                      1 :white}}})

(facts "about turning the world to cells"
  (fact "it returns an array of arrays of renderable cells"
    (world->cells world) => [[{:color :white :ant :north} {:color :grey}]
                             [{:color :grey} {:color :white}]]))
