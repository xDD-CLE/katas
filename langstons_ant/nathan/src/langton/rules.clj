(ns langton.rules
  (:require [clojure.string :as string]))

(def current-rule-set (atom {}))
(def all-colors [:white :grey :green :blue :red :yellow :magenta :cyan :black])
(def directions [:north :east :south :west])

(defn- make-color-sequence [size]
  {:pre [(pos? size)
         (<= size (count all-colors))]}
  (let [colors (take size all-colors)
        colors-shifted-by-1 (conj (vec (drop 1 colors)) (first colors))]
    (map vector colors colors-shifted-by-1)))

(defn- chars->rule-set [chars]
  (let [color-sequence (make-color-sequence (count chars))
        turn-keys {"R" :right "L" :left}]
    (reduce (fn [m [[color next-color] r-or-l]]
              (assert (get turn-keys r-or-l) (str "Invalid direction " r-or-l))
              (assoc m color {:next-color next-color :turn (get turn-keys r-or-l)}))
            {}
            (map vector color-sequence chars))))

(defn set-rules! [rule-string]
  (reset! current-rule-set
          (-> rule-string
              (string/split #"")
              chars->rule-set)))

(defn next-color [color]
  (get-in @current-rule-set [color :next-color]))

(defn turn-direction [color]
  (get-in @current-rule-set [color :turn]))
