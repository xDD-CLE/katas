defmodule Trigrams do

  def from(text) do
    threes = String.split(text, " ") 
              |> Enum.chunk(3,1)
    keys = Enum.map(threes, &Enum.at(&1, 0))
    vals = Enum.map(threes, &Enum.drop(&1, 1))
    
    %{}
  end

end

defmodule TrigramHelpers do

  def break_into_threes(text) do
    String.split(text, " ") |> Enum.chunk(3,1)
  end

  def create_keys_from(threes) do
    Enum.map(threes, &Enum.at(&1,0)) |> Enum.uniq
  end


end
