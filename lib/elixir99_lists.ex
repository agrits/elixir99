defmodule Elixir99.Lists do
  @moduledoc """
  Documentation for `Elixir99.Lists`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elixir99.Lists.hello()
      :world

  """
  def hello do
    :world
  end

  def last(list) when length(list) >= 1 do
    [head | tail] = list

    case tail do
      [] -> head
      _ -> last(tail)
    end
  end

  def but_last(list) when length(list) >= 2  do
    [_head | tail] = list
    case tail do
      [but, _] -> but
      _ -> but_last(tail)
    end
  end

  def element_at(list, index) when index < length(list) do
    [head | tail] = list
    case index do
      0 -> head
      _ -> element_at(tail, index-1)
    end
  end

  def my_length(list, len \\ 0) do
    case list do
      [] -> 0
      [_head | tail] ->
        case tail do
          [] -> len + 1
          _ -> my_length(tail, len+1)
        end
    end
  end

  def reverse(list, acc \\ []) do
    case list do
      [] -> acc
      [head | tail] -> reverse(tail, [head] ++ acc)
    end
  end

  def is_palindrome(list) do
    list == reverse(list)
  end

  def flatten(list) do
    case list do
      x when not is_list(x) -> [x]
      [] -> []
      [head | tail] -> flatten(head) ++ flatten(tail)
    end
  end

  def compress(list, acc \\ []) do
    case list do
      [] -> []
      [_] ->
        acc ++ list
      [first , second | tail] ->
        if first == second do
          compress([first] ++ tail, acc)
        else
          compress([second] ++ tail, acc ++ [first])
        end
    end
  end

  def pack(list) do
    case list do
      [first, second | tail] when is_list(first) ->
        if hd(first) == second do
          pack([first ++ [second]] ++ tail)
        else
          [first] ++ pack([second] ++ tail)
        end
      [first, second | tail] ->
        if first == second do
          pack([[first, second]] ++ tail)
        else
          [[first]] ++ pack([second] ++ tail)
        end
      [] -> []
      [x] -> [[x]]
    end
  end

  def encode(list, current \\ nil, acc \\ [], counter \\ 0) do

    case list do
      [] ->
        acc ++ [{counter, current}]
      [head | tail] ->
        if head == current do
          encode(tail, current, acc, counter+1)
        else
          new_acc = if counter > 0, do: acc ++ [{counter, current}], else: acc
          encode(tail, head, new_acc, 1)
        end
    end
  end
end
