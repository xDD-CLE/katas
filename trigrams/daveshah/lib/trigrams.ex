defmodule Trigrams do

  def from(text) do
    threes = String.split(text, " ") 
              |> Enum.chunk(3,1)
    keys = Enum.map(threes, &Enum.at(&1, 0))
    vals = Enum.map(threes, &Enum.drop(&1, 1))
    key_val_tupples = Enum.zip(keys,vals)

    map_with_keys = Enum.reduce(keys, %{}, 
                  fn (key, map) -> Dict.put(map,key,[]) 
                  end
                )
    Enum.reduce(key_val_tupples, map_with_keys,
                  fn(tupple, map) ->
                    Dict.update!(map, elem(tupple,0), 
                      fn(arr) ->
                        arr ++ elem(tupple,1) |> Enum.uniq
                      end
                      )
                  end
                )
  end

end


