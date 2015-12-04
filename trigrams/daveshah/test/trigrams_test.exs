defmodule TrigramsTest do
  use ExUnit.Case
  doctest Trigrams 

  test "that it returns a trigram map" do
    simple_sentance = "I wish I may I wish I might"
    trigrams = Trigrams.from(simple_sentance)
    assert is_map(trigrams)
  end
  

   test "that the keys within the map are 2 word pairs" do
     simple_sentance = "I wish I may I wish I might"
     trigrams = Trigrams.from(simple_sentance)

     assert Dict.get(trigrams,"I") == ["wish", "I", "may"]
     assert Dict.get(trigrams,"wish") == ["I", "may", "might"]
     assert Dict.get(trigrams,"may") == ["I", "wish"]
   end
end

