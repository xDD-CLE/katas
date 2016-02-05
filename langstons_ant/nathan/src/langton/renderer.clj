(ns langton.renderer
  (:require [clojure.string :refer [join]])
  (:require [clojure.term.colors :refer :all]))

(defn- back-to-top []
  (print (str (char 27) "[;H"))) ; move cursor to the top left corner

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

(defn cells->string [cells]
  (let [cells-for-printing (map #(map print-cell %) cells)
        row-strings (map join cells-for-printing)]
    (join "\n" row-strings)))

(defn render [cells]
  (back-to-top)
  (println (cells->string cells)))
