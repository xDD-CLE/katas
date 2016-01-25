(ns langton.renderer
  (:require [clojure.string :refer [join]])
  (:require [clojure.term.colors :refer :all])
  (:require [langton.grid :as grid]))

(defn- back-to-top []
  (print (str (char 27) "[;H"))) ; move cursor to the top left corner

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

(defn- cell-character [faces]
  (condp = faces
    :north (red (bold "^"))
    :east  (red (bold ">"))
    :south (red (bold "v"))
    :west  (red (bold "<"))
           " "))

(defn- print-cell [{:keys [color ant] :or {ant nil}}]
  (let [bg-color-fn (condp = color :white on-white :black on-grey)]
    (bg-color-fn (cell-character ant))))

(defn world->string [world]
  (let [cells (world->cells world)
        cells-for-printing (map #(map print-cell %) cells)
        row-strings (map join cells-for-printing)]
    (join "\n" row-strings)))

(defn render [world]
  (back-to-top)
  (println (world->string world))
  world)
