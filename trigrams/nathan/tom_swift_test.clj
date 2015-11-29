(ns tom-swift-test
  (:require [clojure.test :refer :all]))

(load-file "tom_swift.clj")

(def expected-trigrams
  {"I wish" ["I" "I"] "wish I" ["may" "might"] "I may" ["I"] "may I" ["wish"]})

(deftest no-trigrams
  (is (= {} (tom-swift/trigrams-for "I wish"))))

(deftest one-trigrams
  (is (= {"I wish" ["I"]} (tom-swift/trigrams-for "I wish I"))))

(deftest multiple-trigrams
  (is (= {"I wish" ["I"] "wish I" ["may"]}
         (tom-swift/trigrams-for "I wish I may"))))

(deftest more-multiple-trigrams
  (is (= expected-trigrams
         (tom-swift/trigrams-for "I wish I may I wish I might"))))

(deftest no-blathering
  (is (= "" (tom-swift/blather "I wish"))))

(deftest simple-blathering
  (is (= "I wish I" (tom-swift/blather "I wish I"))))

(defn note [desc data]
  (do
    (println "[NOTE] " desc ": " data)
    data))

(deftest aphasic-blathering
  (is (every?
        (fn [[a b c]]
          (contains? (set (get expected-trigrams (str a " " b))) c))
        (partition
          3 1
          (clojure.string/split
            (tom-swift/blather "I wish I may I wish I might") #"\s+" )))))

(run-tests)
