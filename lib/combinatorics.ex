defmodule Combinatorics do
  @moduledoc """
  Functions of Combinatorics.

  See [Combinatorics - Wikipedia](https://en.wikipedia.org/wiki/Combinatorics), etc.
  """

  @doc """
  Generate Permutaitons.

      iex> Combinatorics.permutation([1, 2, 3])
      [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
  """
  def permutation(list), do: permutation(list, Enum.count(list))

  @doc """
  Generate Permutaitons.

      iex> Combinatorics.permutation([1, 2, 3], 2)
      [[1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2]]
      iex> Combinatorics.permutation([1, 2, 3], 0)
      []
  """
  def permutation(_, n) when n <= 0, do: []
  def permutation(list, 1), do: Enum.map(list, &[&1])
  def permutation(list, n) do
    list
    |> Enum.flat_map(fn elem ->
      list
      |> List.delete(elem)
      |> permutation(n - 1)
      |> Enum.map(&[elem | &1])
    end)
  end

  @doc """
  Generate Combinations.

      iex> Combinatorics.combination([1, 2, 3], 2)
      [[1, 2], [1, 3], [2, 3]]
      iex> Combinatorics.combination([1, 2, 3], 3)
      [[1, 2, 3]]
      iex> Combinatorics.combination([1, 2, 3], 0)
      []
  """
  def combination([], _), do: []
  def combination(_, n) when n <= 0, do: []
  def combination(list, 1), do: Enum.map(list, &[&1])
  def combination([first | rest], n) do
    prev = combination(rest, n)
    rest
    |> combination(n - 1)
    |> Enum.reverse()
    |> Enum.reduce(prev, &[[first | &1] | &2])
  end
end