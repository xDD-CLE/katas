(ns tom-swift
  (:require [clojure.string :as string]))

(defn- join-strs [& strings]
  (string/join " " (flatten strings)))

(defn- split-str [string]
  (string/split string #"\s+"))

(defn- build-trigrams
  ([strings]
   (build-trigrams {} strings))

  ([trigrams [a b c & more]]
   (if c
     (recur
       (merge-with concat trigrams {(join-strs a b) [c]})
       (concat [b c] more))
     trigrams)))

(defn trigrams-for [document]
  (build-trigrams (split-str document)))

(defn- blather-with-trigrams [trigrams iterations words]
  (let [last-digram (join-strs (take-last 2 words))
        next-word (rand-nth (get trigrams last-digram))]
    (if (and next-word (pos? iterations))
      (recur trigrams (- iterations 1) (conj words next-word))
      words)))

(defn blather
  ([document]
   (blather document 10))

  ([document iterations]
   (let [trigrams (trigrams-for document)
         seed (rand-nth (keys trigrams))]
     (if seed
       (join-strs (blather-with-trigrams trigrams iterations (split-str seed)))
       ""))))

(let [filename (second *command-line-args*)]
  (if filename
    (println (blather (slurp filename) 100))))
