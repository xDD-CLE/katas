(ns langton.ant-test
  (:use midje.sweet
        [langton.ant]
        [langton.rules :refer [set-rules!]]))

(set-rules! "RL")

(def ant (create))

(facts "about creating ants"
  (fact "a new ant starts at the origin"
    (:pos ant) => [0 0])

  (fact "a new ant starts facing west"
     (:faces ant) => :west))

(facts "about turning"
  (fact "it turns left when given :grey"
    (map :faces (take 5 (iterate #(turn % :grey) ant)))
      => [:west :south :east :north :west])

  (fact "it turns right when given :white"
    (map :faces (take 5 (iterate #(turn % :white) ant)))
      => [:west :north :east :south :west]))

(facts "about stepping"
  (fact "it advances forward by one"
    (:pos (step (create :pos [0 0] :faces :north))) => [ 0  1]
    (:pos (step (create :pos [0 0] :faces :west ))) => [-1  0]
    (:pos (step (create :pos [0 0] :faces :south))) => [ 0 -1]
    (:pos (step (create :pos [0 0] :faces :east ))) => [ 1  0]))
