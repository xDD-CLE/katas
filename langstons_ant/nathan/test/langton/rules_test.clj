(ns langton.rules-test
  (:use midje.sweet
        [langton.rules]))

(facts "about setting the rules"
  (fact "it creates rule sets from the left/right direction instructions"
    (create "L")    => {:white {:next-color :white :turn :left }}
    (create "R")    => {:white {:next-color :white :turn :right}}
    (create "RL")   => {:white {:next-color :grey  :turn :right}
                        :grey  {:next-color :white :turn :left }}
    (create "LLRR") => {:white {:next-color :grey  :turn :left }
                        :grey  {:next-color :green :turn :left }
                        :green {:next-color :blue  :turn :right}
                        :blue  {:next-color :white :turn :right}}
    (create "LRRRRRLLR") => {:white   {:next-color :grey    :turn :left }
                             :grey    {:next-color :green   :turn :right}
                             :green   {:next-color :blue    :turn :right}
                             :blue    {:next-color :red     :turn :right}
                             :red     {:next-color :yellow  :turn :right}
                             :yellow  {:next-color :magenta :turn :right}
                             :magenta {:next-color :cyan    :turn :left }
                             :cyan    {:next-color :black   :turn :left }
                             :black   {:next-color :white   :turn :right}}))
