defmodule Elixir99.Lists3Test do
  use ExUnit.Case
  import Elixir99.Lists3
  doctest Elixir99.Lists3

  test "insert-at should insert element at given position (indexing from 1)" do
    assert :elem |> insert_at([1,2,3,4], 2) == [1, :elem, 2, 3, 4]
  end

  test "range should create a list of numbers within a given range" do
    assert range(4, 9) == Enum.to_list 4..9
  end
end
