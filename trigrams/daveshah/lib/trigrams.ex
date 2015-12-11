defmodule Trigrams do
  import Enum
  import Dict
  import List

  def from(text) do
    String.split(text, ~r{\W}, trim: true) 
    |> chunk(3,1) 
    |> map(&reverse(&1))
    |> reduce(%{}, 
      fn(array, dict_accumulator) -> 
        update(dict_accumulator, tl(array) |> reverse |> join(" "), [hd(array)], 
          fn(current) -> 
            flatten(current ++  [hd(array)]) 
          end
        )
      end
    )
  end

end


