(ns tom-swift-test
  (:require [clojure.test :refer :all]))

(load-file "tom_swift.clj")

(deftest no-trigrams
  (is (= {} (tom-swift/trigrams-for "I wish"))))

(deftest one-trigrams
  (is (= {"I wish" ["I"]} (tom-swift/trigrams-for "I wish I"))))

(deftest multiple-trigrams
  (is (= {"I wish" ["I"] "wish I" ["may"]}
         (tom-swift/trigrams-for "I wish I may"))))

(deftest more-multiple-trigrams
  (is (= {"I wish" ["I" "I"] "wish I" ["may" "might"] "I may" ["I"] "may I" ["wish"]}
         (tom-swift/trigrams-for "I wish I may I wish I might"))))

(run-tests)
