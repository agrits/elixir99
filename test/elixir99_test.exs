defmodule Elixir99Test do
  use ExUnit.Case
  import Elixir99
  doctest Elixir99

  test "greets the world" do
    assert hello() == :world
  end

  test "last returns the last element of given list" do
    assert [1,2,3,4] |> last == 4
    assert ["a", "b", "c", "d"] |> last == "d"
    assert [:a, "b", 3] |> last == 3
  end

  test "but_last returns the one but last element of given list" do
    assert [1,2,3,4] |> but_last == 3
    assert ["a", "b", "c", "d"] |> but_last == "c"
    assert [:a, "b", 3] |> but_last == "b"
  end

  test "element_at returns element at given index" do
    assert [1,2,3,4] |> element_at(0) == 1
    assert ["a", "b", "c", "d"] |> element_at(3) == "d"
    assert [:a, "b", 3] |> element_at(1) == "b"
  end

  test "my_length returns number of elements of a list" do
    assert [1,2,3] |> my_length == 3
    assert [] |> my_length == 0
  end

  test "reverse returns the list in reversed order" do
    assert [1,2,3,4] |> reverse == [4,3,2,1]
    assert [] |> reverse == []
    assert [1] |> reverse == [1]
  end

  test "is_palindrome should check if reversing a string or list does not affect it" do
    assert 'kajak' |> is_palindrome == true
    assert [1,2,3,4] |> is_palindrome == false
    assert [1,2,3,3,2,1] |> is_palindrome == true
  end

  test "flatten should recursively replace every list with its elements" do
    assert [] |> flatten == []
    assert [1] |> flatten == [1]
    assert [1, [2, [3, [4, 5], 6], [7, 8]], 9] |> flatten == Enum.to_list(1..9)
  end

  test "compress should eliminate consecutive duplicates in the list" do
    assert compress([1, 1, 2, 2, 2, 3, 2, 2, 4]) == [1, 2, 3, 2, 4]
  end

  test "pack should pack consecutive duplicates in the list" do
    assert pack([1, 1, 2, 2, 2, 3, 2, 2, 4]) == [[1, 1], [2, 2, 2], [3], [2, 2], [4]]
  end

  test "encode should replace consecutive duplicates with tuple (n, el) where n is number of consecutive duplicates and el is the element" do
    assert encode([1, 1, 2, 2, 2, 3, 2, 2, 4]) == [{2, 1}, {3, 2}, {1, 3}, {2, 2}, {1, 4}]
  end
end
