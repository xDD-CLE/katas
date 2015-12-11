defmodule Trigrams do

  def from(text) do
    String.split(text, ~r{\W}, trim: true) 
    |> Enum.chunk(3,1) 
    |> Enum.map(&Enum.reverse(&1))
    |> Enum.reduce(%{}, 
        fn(arr,dict) -> 
          Dict.update(dict, Enum.join(Enum.reverse(tl(arr))," "), [hd(arr)], 
            fn(current) -> 
              List.flatten(current ++  [hd(arr)]) 
            end
           )
        end
    )
  end

end


