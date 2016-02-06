(ns langton.rules)

(def directions [:north :west :south :east])

(def ^{:private true} color-progression
  {:white :black
   :black :white})

(def colors (into #{} (keys color-progression)))

(defn next-color [current-color]
  (current-color color-progression))

(defn next-direction [current-direction current-color]
  (let [current-index (.indexOf directions current-direction)
        inc-or-dec (if (= :black current-color) inc dec)
        next-index (mod (inc-or-dec current-index) (count directions))]
    (assert (>= current-index 0) (str "Invalid direction " current-direction))
    (directions next-index)))
