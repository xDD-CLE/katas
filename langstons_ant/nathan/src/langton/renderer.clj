(ns langton.renderer
  (:require [clojure.string :refer [join]]
            [clojure.term.colors :refer :all]
            [langton.rules :as rules]))

(defn- back-to-top []
  (print (str (char 27) "[;H"))) ; move cursor to the top left corner

(defn- cell-character [faces]
  (condp = faces
    :north (red (bold "^"))
    :east  (red (bold ">"))
    :south (red (bold "v"))
    :west  (red (bold "<"))
           " "))

(def ^{:private true} on-black identity)

(defn- bg-color-fn [color]
  {:pre [(color @rules/current-rule-set)]
   :post [%]}
  (->> color
       name
       (str "on-")
       symbol
       (ns-resolve 'langton.renderer)))

(defn- print-cell [{:keys [color ant] :or {ant nil}}]
  ((bg-color-fn color) (cell-character ant)))

(defn cells->string [cells]
  (let [cells-for-printing (map #(map print-cell %) cells)
        row-strings (map join cells-for-printing)]
    (join "\n" row-strings)))

(defn render [cells]
  (back-to-top)
  (println (cells->string cells)))
