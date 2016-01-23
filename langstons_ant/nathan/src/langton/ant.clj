(ns langton.ant
  (:use [langton.core :refer [directions]]))

(defn- next-direction [current-direction color]
  (let [current-index (.indexOf directions current-direction)
        inc-or-dec (if (= :black color) inc dec)
        next-index (mod (inc-or-dec current-index) (count directions))]
    (assert (>= current-index 0) (str "Invalid direction " current-direction))
    (directions next-index)))

(defn- next-pos [[x y] faces]
  (condp = faces
    :north [     x  (inc y)]
    :west  [(dec x)      y ]
    :south [     x  (dec y)]
    :east  [(inc x)      y ]))

(defn create
  ([] (create {:pos [0 0] :faces :north}))
  ([{:keys [pos faces]}]
     {:pos pos
      :faces faces
      :turn (fn [color]
              (create {:pos pos
                       :faces (next-direction faces color)}))
      :step (fn []
              (create {:pos (next-pos pos faces)
                       :faces faces}))}))
