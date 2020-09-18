defmodule Elixir99.Lists2Test do
  use ExUnit.Case
  import Elixir99.Lists2
  doctest Elixir99.Lists2

  test "encode_modified should behave as Elixir99.Lists.encode, but if an element has no consetive duplicates it shouldn't be packed into tuple" do
    assert [1, 1, 1, 3, 4, 4, 5, 5, 6] |> encode_modified == [{3, 1}, 3, {2, 4}, {2, 5}, 6]
  end

  test "decode_modified should decode a list encoded by encode_modified" do
    assert [{3, 1}, 3, {2, 4}, {2, 5}, 6] |> decode_modified == [1, 1, 1, 3, 4, 4, 5, 5, 6]
  end

  test "encode_directly should behave as Elixir99.Lists2.encode_modified, but without using any function defined in Elixir99.Lists" do
    assert [1, 1, 1, 3, 4, 4, 5, 5, 6] |> encode_directly == [{3, 1}, 3, {2, 4}, {2, 5}, 6]
  end

  test "dupli should duplicate elements of a list one after another" do
    assert [1,2,3] |> dupli == [1, 1, 2, 2, 3, 3]
  end

  test "repli should replicate elements of a list n times" do
    assert [1,2,3] |> repli(3) == [1, 1, 1, 2, 2, 2, 3, 3, 3]
  end

  test "drop_every should drop every nth element" do
    assert 'abcdefgh' |> drop_every(3) == 'abdegh'
  end

  test "split should split a list into two parts, where length of the first part is given as n" do
    assert 'abcdefg' |> split(3) == {'abc', 'defg'}
  end

  test "slice should return content of a list between given n and k indices" do
    assert 'abcdefg' |> slice(2, 5) == 'cde'
  end

  test "rotate should rotate a list n places to the left" do
    assert 'abcdef' |> rotate(2) == 'cdefab'
    assert 'abcdef' |> rotate(-2) == 'efabcd'
  end

  test "remove_at should delete k-th element (index 0 => k=1) and return tuple {k-th element, list without k-th element}" do
    assert 'abcdef' |> remove_at(2) == {List.first('b'), 'acdef'}
  end
end
