(ns langton.core)

(def directions [:north :west :south :east])

(defn- next-direction [current-direction color]
  (let [current-index (.indexOf directions current-direction)
        next-index (mod (inc current-index) (count directions))]
    (assert (>= current-index 0) (str "Invalid direction " current-direction))
    (directions next-index)))

(defn new-ant
  ([] (new-ant {:pos [0 0] :faces :north}))
  ([{:keys [[x y] pos faces]}]
     {:pos pos
      :faces faces
      :turn (fn [color]
              (new-ant {:pos pos
                        :faces (next-direction faces color)}))}))
