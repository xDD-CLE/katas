defmodule TrigramsTest do
  use ExUnit.Case
  doctest Trigrams 

  test "that it returns a trigram map" do
    simple_sentance = "I wish I may I wish I might"
    trigrams = Trigrams.from(simple_sentance)
    assert is_map(trigrams)
  end
  

  #  test "that the keys within the map are 2 word pairs" do
  #    simple_sentance = "I wish I may I wish I might"
  #    trigrams = Trigrams.from(simple_sentance)
  #
  #    keys = Map.keys(trigrams)
  #
  #    assert Enum.any?(keys, fn k -> k == "I wish" end)
  #    assert Enum.any?(keys, fn k -> k == "wish I" end)
  #    assert Enum.any?(keys, fn k -> k == "I may" end)
  #    assert Enum.any?(keys, fn k -> k == "may I" end)
  #  end
end

defmodule TrigramHelpersTest do
  use ExUnit.Case
  doctest TrigramHelpers

  test "that it splits the text into groups of three" do
    simple_sentance = "I wish I may I wish I might"
    broken_sentence = TrigramHelpers.
                      break_into_threes(simple_sentance)
    assert broken_sentence == [["I", "wish", "I"],
                              ["wish", "I", "may"],
                              ["I", "may", "I"],
                              ["may", "I", "wish"],
                              ["I", "wish", "I"],
                              ["wish", "I", "might"]]

  end

  test "that it gives me keys based on the first element of each split of three" do

    broken_sentence = [["I", "wish", "I"],
                      ["wish", "I", "may"],
                      ["I", "may", "I"],
                      ["may", "I", "wish"],
                      ["I", "wish", "I"],
                      ["wish", "I", "might"]]

    keys = TrigramHelpers.create_keys_from(broken_sentence)

    assert keys == ["I", "wish", "may"]
  end

  test "that it creates keys in a map from an array" do
    map = TrigramHelpers.map_from(["I", "wish", "may"])


    assert map == %{"I" => [], "wish" => [], "may" => []}
  end



end
