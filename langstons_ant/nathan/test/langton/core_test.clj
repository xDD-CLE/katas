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
      (fact "it turns left when given :black"
        (:faces ((:turn ant) :black)) => :west
        (:faces ((:turn ((:turn ant) :black)) :black)) => :south)
        (:faces ((:turn ((:turn ((:turn ant) :black)) :black)) :black)) => :east
        (:faces ((:turn ((:turn ((:turn ((:turn ant) :black)) :black)) :black)) :black)) => :north)))
