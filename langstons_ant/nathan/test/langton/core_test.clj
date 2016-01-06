(ns langton.core-test
  (:use midje.sweet)
  (:use [langton.core]))

(facts "about `new-ant`"
  (let [ant (new-ant)]
    (fact "it starts at the origin"
      (:pos ant) => [0 0])

    (fact "it starts facing north"
       (:faces ant) => :north)

    (facts "about turning"
      (letfn [(turn-ant [ant times color]
                (loop [loop-ant ant loop-times times]
                  (if (> loop-times 0)
                    (recur ((:turn loop-ant) color) (dec loop-times))
                    loop-ant)))]

        (fact "it turns left when given :black"
          (:faces (turn-ant ant 1 :black)) => :west
          (:faces (turn-ant ant 2 :black)) => :south
          (:faces (turn-ant ant 3 :black)) => :east
          (:faces (turn-ant ant 4 :black)) => :north)

        (fact "it turns right when given :white"
          (:faces (turn-ant ant 1 :white)) => :east
          (:faces (turn-ant ant 2 :white)) => :south
          (:faces (turn-ant ant 3 :white)) => :west
          (:faces (turn-ant ant 4 :white)) => :north)))))
