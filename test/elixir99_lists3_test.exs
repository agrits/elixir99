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

  test "rnd_select should return n random elements from given list (without repetitions)" do
    n = 3
    list = 'abcdefgh'
    picked = list |> rnd_select(n)
    assert picked |> Enum.all?(&(Enum.member?(list, &1)))
    assert length(picked) == n
    assert picked |> Enum.uniq |> length == n
  end

  test "lotto should pick N different numbers from set 1..M" do
    n = 3
    m = 49
    picked = lotto(n, m)
    assert length(picked) == n
    assert picked |> Enum.all?(&(Enum.member?(1..m, &1)))
    assert picked |> Enum.uniq |> length == n
  end

  test "rnd_permu should generate radnom permutation of list's elements (shuffle it)" do
    l1 = 'abcdefgh'
    l2 = [1, 2, 3, 4, 5]
    assert l1 |> rnd_permu |> Enum.sort == l1
    assert l2 |> rnd_permu |> Enum.sort == l2
  end
end
