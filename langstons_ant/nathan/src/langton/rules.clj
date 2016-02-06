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
        turn-fns {"R" inc "L" dec}]
    (reduce (fn [m [[color next-color] r-or-l]]
              (assert (get turn-fns r-or-l) (str "Invalid direction " r-or-l))
              (assoc m color {:next-color next-color :turn (get turn-fns r-or-l)}))
            {}
            (map vector color-sequence chars))))

(defn set-rules! [rule-string]
  (reset! current-rule-set
          (-> rule-string
              (string/split #"")
              chars->rule-set)))

(defn next-color [color]
  (get-in @current-rule-set [color :next-color]))

(defn note [value] (doto value prn))

(defn next-direction [current-direction color]
  {:pre [(color @current-rule-set)]}
  (let [current-index (.indexOf directions current-direction)
        inc-or-dec (get-in @current-rule-set [color :turn])
        next-index (mod (inc-or-dec current-index) (count directions))]
    (assert (>= current-index 0) (str "Invalid direction " current-direction))
    (directions next-index)))
