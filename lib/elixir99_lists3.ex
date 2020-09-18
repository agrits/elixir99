defmodule Elixir99.Lists3 do

  def insert_at(element, list, k) do
    splitted = list |> Elixir99.Lists2.split(k-1)
    elem(splitted, 0) ++ [element] ++ elem(splitted, 1)
  end

  def range(s, e, acc \\ []) do
    case s > e do
      true -> acc
      false -> range(s+1, e, acc++[s])
    end
  end
end
