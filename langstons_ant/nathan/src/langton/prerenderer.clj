(ns langton.prerenderer
  (:require [langton.grid :as grid]))

(defn- cell-symbol [{:keys [ant grid]} coord]
  (let [color (get-in grid coord)]
    (if (= coord (:pos ant))
      {:color color :ant (:faces ant)}
      {:color color})))

(defn world->cells [{:keys [grid] :as world}]
  (let [x-coords (grid/x-coords grid)
        y-coords (grid/y-coords grid)]
    (map (fn [y]
            (map #(cell-symbol world [% y]) x-coords))
          y-coords)))
