(ns langton.ant
  (:require [langton.rules :as rules]))

(def directions [:north :west :south :east])

(defn- next-pos [[x y] faces]
  (condp = faces
    :north [     x  (inc y)]
    :west  [(dec x)      y ]
    :south [     x  (dec y)]
    :east  [(inc x)      y ]))

(defn create [& {:keys [pos faces]
                 :or {pos [0 0] faces :west}}]
  {:pos pos :faces faces})

(defn turn [{:keys [faces] :as ant} color]
  (assoc ant :faces (rules/next-direction faces color)))

(defn step [{:keys [pos faces] :as ant}]
  (assoc ant :pos (next-pos pos faces)))
