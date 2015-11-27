(ns tom-swift
  (:require [clojure.string :as string]))

(defn -build-trigrams
  ([strings]
   (-build-trigrams {} strings))
  ([trigrams [a b c & more]]
   (if c
     (-build-trigrams
       (merge-with concat trigrams {(str a " " b) [c]}) (concat [b c] more))
     trigrams)))

(defn trigrams-for [document]
  (-build-trigrams (string/split document #"\s+")))
