(ns langton.runner
  (:require [langton.ant :as ant])
  (:require [langton.grid :as grid]))

(defn- next-color [current-color]
  (current-color {:white :black
                  :black :white}))

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
        next-color (next-color current-color)
        new-ant (-> ant (ant/turn current-color) ant/step)]
    {:ant new-ant
     :grid (-> grid
               (grid/color next-color (:pos ant))
               (expand-if-necessary (:pos new-ant)))}))
