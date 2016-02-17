(ns langton.core
  (:require [clojure.tools.cli :refer [parse-opts]]
            [langton.rules :as rules]
            [langton.runner :as runner]
            [langton.ant :as ant]
            [langton.grid :as grid]
            [langton.prerenderer :refer [world->cells]]
            [langton.renderer :as renderer]))

(def cli-options
  [["-i" "--interval INTERVAL" "Interval"
    :default 1000
    :parse-fn #(Integer/parseInt %)
    :validate [pos? "Must be greater than zero"]]
   ["-s" "--steps STEPS" "Steps"
    :default 100
    :parse-fn #(Integer/parseInt %)
    :validate [pos? "Must be greater than zero"]]])

(defn run-simulation [render-fn rule-set iterations interval]
  (letfn [(render-world [world]
            (-> world world->cells render-fn)
            world)]
    (doall
      (take iterations
            (iterate #(do (Thread/sleep interval)
                          (render-world (runner/run %)))
                     (render-world {:ant (ant/create)
                                    :grid (grid/create)
                                    :rules (rules/create rule-set)}))))))

(defn -main [& args]
  (let [opts       (parse-opts args cli-options)
        rule-set   (first (:arguments opts))
        iterations (get-in opts [:options :steps])
        interval   (get-in opts [:options :interval])
        error      (:error opts)]
    (when error (throw (str "Illegal usage:" error)))
    (print (str (char 27) "[2J")) ; clear screen
    (run-simulation renderer/render rule-set iterations interval)))
