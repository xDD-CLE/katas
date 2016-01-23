(ns langton.grid-test
  (:use midje.sweet)
  (:use [langton.grid]))

(def white-1x1 {0 {0 :white}})
(def black-1x1 {0 {0 :black}})
(def white-2x2 {0 {0 :white 1 :white}
                1 {0 :white 1 :white}})

(facts "about creating grids"
  (fact "they contain a single :white cell"
    (create) => white-1x1))

(facts "about coloring grids"
  (fact "it colors the specified cells with the given color"
    (color white-1x1 :black [0 0]) => black-1x1
    (color black-1x1 :white [0 0]) => white-1x1
    (color white-2x2 :black [1 1] [1 0]) => {0 {0 :white 1 :white}
                                             1 {0 :black 1 :black}})
  (fact "it throws an error if the given color is neither :white nor :black"
    (color white-1x1 :blue [0 0]) => (throws AssertionError))

  (fact "it throws an error if the given coordinates are off the grid"
    (color white-1x1 :black [0 1]) => (throws AssertionError)
    (color white-1x1 :black [1 0]) => (throws AssertionError)))

(facts "about expanding grids"
  (fact "it expands the grid by 1 with :white cells in the given direction"
    (expand white-1x1 :north) => { 0 { 0 :white
                                       1 :white}}
    (expand white-1x1 :east)  => { 0 { 0 :white}
                                   1 { 0 :white}}
    (expand white-1x1 :south) => { 0 {-1 :white
                                       0 :white}}
    (expand white-1x1 :west)  => {-1 { 0 :white}
                                   0 { 0 :white}})

  (fact "expansion doesn't change the color of existing cells"
    (expand black-1x1 :north) => { 0 { 0 :black
                                       1 :white}}
    (expand black-1x1 :east)  => { 0 { 0 :black}
                                   1 { 0 :white}}
    (expand black-1x1 :south) => { 0 {-1 :white
                                       0 :black}}
    (expand black-1x1 :west)  => {-1 { 0 :white}
                                   0 { 0 :black}})

  (fact "it throws an error if the given direction is illegal"
    (expand white-1x1 :blerg) => (throws java.lang.IllegalArgumentException)))
