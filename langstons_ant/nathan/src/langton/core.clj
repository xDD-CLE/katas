(ns langton.core
  (:require [clojure.tools.cli :refer [parse-opts]])
  (:require [langton.runner :as runner])
  (:require [langton.ant :as ant])
  (:require [langton.grid :as grid])
  (:require [langton.renderer :refer [render]]))

(def cli-options
  [["-i" "--interval INTERVAL" "Interval"
    :default 1000
    :parse-fn #(Integer/parseInt %)
    :validate [pos? "Must be greater than zero"]]])

(defn -main [& args]
  (let [opts (parse-opts args cli-options)
        interval (get-in opts [:options :interval])
        iterations (Integer/parseInt (first (:arguments opts)))
        error (:error opts)]
    (if error
      (throw (str "Illegal usage:" error))
      (doall
        (take iterations
              (iterate #(do
                          (Thread/sleep interval)
                          (-> % runner/run render))
                       (render {:ant (ant/create) :grid (grid/create)})))))))
