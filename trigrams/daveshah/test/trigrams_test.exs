defmodule TrigramsTest do
  use ExUnit.Case
  doctest Trigrams 

  test "that it returns a trigram map" do
    simple_sentance = "I wish I may I wish I might"
    trigrams = Trigrams.from(simple_sentance)
    assert is_map(trigrams)
  end
end
