(defproject langton "0.0.1-SNAPSHOT"
  :description "Cool new project to do things and stuff"
  :dependencies [[org.clojure/clojure "1.4.0"]
                 [org.clojure/tools.cli "0.3.3"]
                 [clojure-term-colors "0.1.0-SNAPSHOT"]]
  :profiles {:dev {:dependencies [[midje "1.5.1"]]
                   :plugins [[lein-midje "3.1.3"]]}}
  :main langton.core)
