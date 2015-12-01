(ns tom-swift
  (:require [clojure.string :as string]))

(defn- rand-item [coll]
  (if (not (empty? coll))
    (clojure.core/rand-nth coll)))

(defn- join-strs [& strings]
  (string/join " " (flatten strings)))

(defn- split-str [string]
  (string/split string #"\s+"))

(defn- punctuate [string]
  (if (re-find #"\w$" string)
    (str string ".")
    string))

(defn- build-trigrams [strings]
  (loop [trigrams {}
         [a b c & more] strings]
   (if c
     (recur
       (merge-with concat trigrams {(join-strs a b) [c]})
       (concat [b c] more))
     trigrams)))

(defn- blather-with-trigrams [trigrams remaining words]
  (let [last-digram (join-strs (take-last 2 words))
        next-word (rand-item (get trigrams last-digram))]
    (if (and next-word (pos? remaining))
      (recur trigrams (- remaining 1) (conj words next-word))
      words)))

(defn trigrams-for [document]
  (build-trigrams (split-str document)))

(defn blather
  ([document]
   (blather document 10))

  ([document length]
   (let [trigrams (trigrams-for document)
         seed (rand-item (filter (partial re-find #"^[A-Z]") (keys trigrams)))]
     (if seed
       (punctuate
         (join-strs (blather-with-trigrams trigrams (- length 2) (split-str seed))))
       ""))))

(let [filename (second *command-line-args*)]
  (if filename
    (println (blather (slurp filename) 200))))
