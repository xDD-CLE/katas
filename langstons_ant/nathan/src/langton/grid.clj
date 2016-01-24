(ns langton.grid
  (:use [langton.core :refer [colors]]))

(defn- all-y-coords [grid]
  (map keys (vals grid)))

(defn x-coords [grid]
  (-> grid keys sort))

(defn y-coords [grid]
  (-> grid all-y-coords flatten sort distinct))

(defn- add-row [inc-or-dec grid]
  (let [first-or-last (get {inc last dec first} inc-or-dec)
        new-row-num (inc-or-dec (first-or-last (y-coords grid)))]
    (reduce #(assoc-in %1 [%2 new-row-num] :white) grid (keys grid))))

(defn- add-col [inc-or-dec grid]
  (let [first-or-last (get {inc last dec first} inc-or-dec)
        new-row-num (inc-or-dec (first-or-last (x-coords grid)))]
    (assoc grid new-row-num (into {} (map (fn [[k _]] [k :white]) (grid 0))))))

(defn create []
  {0 {0 :white}})

(defn color [grid color & coords]
  {:pre [(color colors)]
   :post [(= (x-coords grid) (x-coords %))
          (= (all-y-coords grid) (all-y-coords %))]}
  (reduce #(assoc-in %1 %2 color) grid coords))

(defn expand [grid direction]
  (condp = direction
    :north (add-row inc grid)
    :east  (add-col inc grid)
    :south (add-row dec grid)
    :west  (add-col dec grid)))
