(ns langton.grid
  (:use [langton.core :refer [colors]]))

(def ^{:private true} x-coords keys)
(defn- y-coords [grid]
  (map keys (vals grid)))

(defn- add-row [inc-or-dec grid]
  (let [max-or-min (get {inc max dec min} inc-or-dec)
        new-row-num (inc-or-dec (apply max-or-min (flatten (y-coords grid))))]
    (reduce #(assoc-in %1 [%2 new-row-num] :white) grid (keys grid))))

(defn- add-col [inc-or-dec grid]
  (let [max-or-min (get {inc max dec min} inc-or-dec)
        new-row-num (inc-or-dec (apply max-or-min (flatten (x-coords grid))))]
    (assoc grid new-row-num (into {} (map (fn [[k _]] [k :white]) (grid 0))))))

(defn create []
  {0 {0 :white}})

(defn color [grid color & coords]
  {:pre [(color colors)]
   :post [(= (x-coords grid) (x-coords %))
          (= (y-coords grid) (y-coords %))]}
  (reduce #(assoc-in %1 %2 color) grid coords))

(defn expand [grid direction]
  (condp = direction
    :north (add-row inc grid)
    :east  (add-col inc grid)
    :south (add-row dec grid)
    :west  (add-col dec grid)))
