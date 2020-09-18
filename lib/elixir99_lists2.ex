defmodule Elixir99.Lists2 do

  def encode_modified(list, current \\ nil, acc \\ [], counter \\ 0) do
    new_acc = case counter do
      0 -> acc
      1 -> acc ++ [current]
      _ -> acc ++ [{counter, current}]
    end
    case list do
      [] -> new_acc
      [head | tail] ->
        if head == current do
          encode_modified(tail, current, acc, counter+1)
        else
          encode_modified(tail, head, new_acc, 1)
        end
    end
  end

  defp duplicate(element, count, acc \\ []) do
    case count do
      0 -> []
      1 -> acc ++ [element]
      _ -> duplicate(element, count - 1, acc ++ [element])
    end
  end

  defp decode_tuple(tuple) do
    elem(tuple, 1) |> duplicate(elem(tuple, 0))
  end
  def decode_modified(list, acc \\ []) do
    case list do
      [] -> acc
      [head | tail] ->
        case is_tuple(head) do
          false -> decode_modified(tail, acc ++ [head])
          true -> decode_modified(tail, acc ++ decode_tuple(head))
        end
    end
  end

  def encode_directly(list) do
    encode_modified(list)
  end

  def dupli(list, acc \\ []) do
    case list do
      [] -> acc
      [head | tail] -> dupli(tail, acc ++ [head, head])
    end
  end

  def repli(list, n, acc \\ []) do
    case list do
      [] -> acc
      [head | tail] -> repli(tail, n, acc ++ duplicate(head, n))
    end
  end

  def drop_every(list, n, acc \\ [], count \\ 1) do
    case list do
      [] -> acc
      [head | tail] ->
        case count == n do
          true -> drop_every(tail, n, acc, 1)
          false -> drop_every(tail, n, acc++[head], count+1)
        end
    end
  end

  def split(list, n, acc \\ [], count \\ 1) do
    case length(list) > n-count do
      true ->
        [head | tail] = list
        case count == n do
          true -> {acc ++ [head], tail}
          false -> split(tail, n, acc ++ [head], count+1)
        end
      false -> {:error, "n cannot be bigger than list length"}
    end
  end

  @spec slice([any], any, any) :: :error | [...] | {:error, <<_::328>>}
  def slice(list, n, k) do
    case length(list) < k or n>k do
      true -> {:error, "length of a list cannot be smaller than k"}
      false -> list
                  |> split(n)
                  |> elem(1)
                  |> split(k-n)
                  |> elem(0)
    end
  end

  def mod(n, k) do
    r = rem(n, k)
    case r < 0 do
      true -> k+r
      false -> r
    end
  end

  def rotate(list, n) do
    k = length(list)
    i = mod(n, k)
    splitted = list |> split(i)
    elem(splitted, 1) ++ elem(splitted, 0)
  end

  def remove_at(list, k, count \\ 1, acc \\ []) do
    [head | tail] = list
    case count == k do
      true -> {head, acc++tail}
      false -> remove_at(tail, k, count+1, acc ++ [head])
    end
  end
end
