(ns langton.runner-test
  (:use midje.sweet
        [langton.runner])
  (:require [langton.ant :as ant]
            [langton.grid :as grid]
            [langton.rules :refer [set-rules!]]))

(set-rules! "RL")

(def north-ant (ant/create :faces :north))
(def white-1x1 (grid/create))
(def grey-1x1  (-> (grid/create) (grid/color :grey [0 0])))
(def white-2x2 (-> (grid/create)
                   (grid/expand :north)
                   (grid/expand :east)))

(facts "about running"
  (fact "it turns the ant"
    (get-in (run {:ant (ant/create :faces :north)
                  :grid white-1x1}) [:ant :faces]) => :east
    (get-in (run {:ant (ant/create :faces :north)
                  :grid grey-1x1}) [:ant :faces]) => :west)

  (fact "it moves the ant forward one step after turning"
    (get-in (run {:ant (ant/create :faces :north)
                  :grid white-1x1}) [:ant :pos]) => [1 0]
    (get-in (run {:ant (ant/create :faces :east)
                  :grid white-1x1}) [:ant :pos]) => [0 -1]
    (get-in (run {:ant (ant/create :faces :south)
                  :grid white-1x1}) [:ant :pos]) => [-1 0]
    (get-in (run {:ant (ant/create :faces :west)
                  :grid white-1x1}) [:ant :pos]) => [0 1])

  (fact "it changes the color of the square the ant started on"
    (get-in (run {:ant north-ant :grid white-1x1}) [:grid 0 0]) => :grey
    (get-in (run {:ant north-ant :grid grey-1x1}) [:grid 0 0]) => :white)

  (fact "it expands the grid as the ant pushes it out"
    ((juxt grid/x-coords grid/y-coords)
      (:grid (run {:ant (ant/create :faces :north) :grid white-1x1})))
        => [[0 1] [0]]
    ((juxt grid/x-coords grid/y-coords)
      (:grid (run {:ant (ant/create :faces :east) :grid white-1x1})))
        => [[0] [-1 0]]
    ((juxt grid/x-coords grid/y-coords)
     (:grid (run {:ant (ant/create :faces :south) :grid white-1x1})))
        => [[-1 0] [0]]
    ((juxt grid/x-coords grid/y-coords)
      (:grid (run {:ant (ant/create :faces :west) :grid white-1x1})))
        => [[0] [0 1]])

  (fact "it doesn't expand the grid if the ant doesn't push it out"
    ((juxt grid/x-coords grid/y-coords)
     (:grid (run {:ant (ant/create :faces :west) :grid white-2x2})))
        => [[0 1] [0 1]]))
