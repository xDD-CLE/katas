(ns langton.ant)

(def directions [:north :west :south :east])

(defn- next-direction [current-direction color]
  (let [current-index (.indexOf directions current-direction)
        inc-or-dec (if (= :black color) inc dec)
        next-index (mod (inc-or-dec current-index) (count directions))]
    (assert (>= current-index 0) (str "Invalid direction " current-direction))
    (directions next-index)))

(defn- next-pos [[x y] faces]
  (condp = faces
    :north [x (inc y)]
    :west  [(dec x) y]
    :south [x (dec y)]
    :east  [(inc x) y]
    (throw (Exception. (str "Unknown direction" faces)))))

(defn new-ant
  ([] (new-ant {:pos [0 0] :faces :north}))
  ([{:keys [pos faces]}]
     {:pos pos
      :faces faces
      :turn (fn [color]
              (new-ant {:pos pos
                        :faces (next-direction faces color)}))
      :step (fn []
              (new-ant {:pos (next-pos pos faces)
                        :faces faces}))}))
