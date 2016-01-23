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

(defn create [& {:keys [pos faces]
                 :or {pos [0 0] faces :north}}]
  {:pos pos :faces faces})

(defn turn [{:keys [faces] :as ant} color]
  (assoc ant :faces (next-direction faces color)))

(defn step [{:keys [pos faces] :as ant}]
  (assoc ant :pos (next-pos pos faces)))
