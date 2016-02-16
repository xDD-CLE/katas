(ns langton.runner
  (:require [langton.ant :as ant]
            [langton.grid :as grid]
            [langton.rules :as rules]))

(defn- expand-if-necessary [grid [new-x new-y]]
  (let [[min-x max-x] ((juxt first last) (grid/x-coords grid))
        [min-y max-y] ((juxt first last) (grid/y-coords grid))]
    (cond
      (< new-x min-x) (grid/expand grid :west)
      (> new-x max-x) (grid/expand grid :east)
      (< new-y min-y) (grid/expand grid :south)
      (> new-y max-y) (grid/expand grid :north)
      :else grid)))

(defn run [{:keys [ant grid] :as world}]
  (let [current-color (get-in grid (:pos ant))
        next-color (rules/next-color current-color)
        turn-dir (rules/turn-direction current-color)
        new-ant (-> ant (ant/turn turn-dir) ant/step)]
    {:ant new-ant
     :grid (-> grid
               (grid/color next-color (:pos ant))
               (expand-if-necessary (:pos new-ant)))}))
