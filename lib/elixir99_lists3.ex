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
  def rnd_select(list, n, acc \\ [])
  def rnd_select(list, 1, acc) do
    index = length(list)
                    |> :rand.uniform
                    |> Kernel.-(1)
    picked = list |> Elixir99.Lists.element_at(index)

    case acc do
      [] -> {[picked], index}
      _ ->
        acc++[picked]
    end
  end

  def rnd_select(list, n, acc) do
    {picked, index} = rnd_select(list, 1)
    new_list = Elixir99.Lists2.remove_at(list, index+1) |> elem(1)
    rnd_select(new_list, n-1, acc++picked)
  end

  def lotto(n, m) do
    rnd_select(range(1, m), n, [])
  end

  def rnd_permu(list) do
    rnd_select(list, length(list))
  end
end
