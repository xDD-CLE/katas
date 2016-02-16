(ns langton.renderer
  (:require [clojure.string :refer [join]]
            [clojure.term.colors :refer :all]))

(defn- back-to-top []
  (print (str (char 27) "[;H"))) ; move cursor to the top left corner

(defn- cell-character [faces]
  (if faces
    (-> (condp = faces
          :north "^"
          :east  ">"
          :south "v"
          :west  "<")
        bold
        red)
    " "))

(defn- on-black [& args] (apply str args))

(defn- bg-color-fn [color]
  {:post [%]}
  (->> color
       name
       (str "on-")
       symbol
       (ns-resolve 'langton.renderer)))

(defn- print-cell [{:keys [color ant] :or {ant nil}}]
  (let [bg-fn (bg-color-fn color)
        character (cell-character ant)]
    (bg-fn character character)))

(defn cells->string [cells]
  (let [cells-for-printing (map #(map print-cell %) cells)
        row-strings (map join cells-for-printing)]
    (join "\n" row-strings)))

(defn render [cells]
  (back-to-top)
  (println (cells->string cells)))
