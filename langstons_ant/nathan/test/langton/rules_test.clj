(ns langton.rules-test
  (:use midje.sweet
        [langton.rules]))

(facts "about setting the rules"
  (fact "it creates rule sets from the left/right direction instructions"
    (set-rules! "L")    => {:white {:next-color :white :turn :left }}
    (set-rules! "R")    => {:white {:next-color :white :turn :right}}
    (set-rules! "RL")   => {:white {:next-color :grey  :turn :right}
                            :grey  {:next-color :white :turn :left }}
    (set-rules! "LLRR") => {:white {:next-color :grey  :turn :left }
                            :grey  {:next-color :green :turn :left }
                            :green {:next-color :blue  :turn :right}
                            :blue  {:next-color :white :turn :right}}
    (set-rules! "LRRRRRLLR") => {:white   {:next-color :grey    :turn :left }
                                 :grey    {:next-color :green   :turn :right}
                                 :green   {:next-color :blue    :turn :right}
                                 :blue    {:next-color :red     :turn :right}
                                 :red     {:next-color :yellow  :turn :right}
                                 :yellow  {:next-color :magenta :turn :right}
                                 :magenta {:next-color :cyan    :turn :left }
                                 :cyan    {:next-color :black   :turn :left }
                                 :black   {:next-color :white   :turn :right}}))

(set-rules! "LRL")
(facts "about advancing colors"
  (next-color :white) => :grey
  (next-color :grey)  => :green
  (next-color :green) => :white)
