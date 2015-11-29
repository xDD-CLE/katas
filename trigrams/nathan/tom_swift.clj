(ns tom-swift
  (:require [clojure.string :as string]))

(defn- build-trigrams
  ([strings]
   (build-trigrams {} strings))

  ([trigrams [a b c & more]]
   (if c
     (build-trigrams
       (merge-with concat trigrams {(str a " " b) [c]}) (concat [b c] more))
     trigrams)))

(defn- trigram-sequence
  ([trigrams iterations seed]
   (trigram-sequence trigrams iterations seed seed))

  ([trigrams iterations seed blathering]
   (let [new-word (rand-nth (get trigrams seed))
         new-seed (str (last (string/split seed #"\s+")) " " new-word)]
     (if (and new-word (pos? iterations))
       (trigram-sequence
         trigrams (- iterations 1) new-seed (str blathering " " new-word))
       blathering))))

(defn trigrams-for [document]
  (build-trigrams (string/split document #"\s+")))

(defn blather [document]
  (let [trigrams (trigrams-for document)
        seed (rand-nth (keys trigrams))]
    (if seed
      (trigram-sequence trigrams 5 seed)
      "")))
