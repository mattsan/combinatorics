defmodule CombinatoricsTest do
  use ExUnit.Case
  doctest Combinatorics

  import Combinatorics

  describe "permute all elements" do
    test "empty list" do
      assert permutation([]) == []
    end

    test "has an element" do
      assert permutation([1]) == [[1]]
    end

    test "has two elements" do
      assert permutation([1, 2]) == [
        [1, 2],
        [2, 1]
      ]
    end

    test "has three elements" do
      assert permutation([1, 2, 3]) == [
        [1, 2, 3], [1, 3, 2],
        [2, 1, 3], [2, 3, 1],
        [3, 1, 2], [3, 2, 1]
      ]
    end

    test "has four elements" do
      assert permutation([1, 2, 3, 4]) == [
        [1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4], [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2],
        [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4], [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1],
        [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4], [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1],
        [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3], [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]
      ]
    end
  end

  describe "permute some elements" do
    test "P(3, 1)" do
      assert permutation([1, 2, 3], 1) == [[1], [2], [3]]
    end

    test "P(3, 2)" do
      assert permutation([1, 2, 3], 2) == [
        [1, 2], [1, 3],
        [2, 1], [2, 3],
        [3, 1], [3, 2]
      ]
    end

    test "P(4, 3)" do
      assert permutation([1, 2, 3, 4], 3) == [
        [1, 2, 3], [1, 2, 4], [1, 3, 2], [1, 3, 4], [1, 4, 2], [1, 4, 3],
        [2, 1, 3], [2, 1, 4], [2, 3, 1], [2, 3, 4], [2, 4, 1], [2, 4, 3],
        [3, 1, 2], [3, 1, 4], [3, 2, 1], [3, 2, 4], [3, 4, 1], [3, 4, 2],
        [4, 1, 2], [4, 1, 3], [4, 2, 1], [4, 2, 3], [4, 3, 1], [4, 3, 2]
      ]
    end

    test "P(4, 0)" do
      assert permutation([1, 2, 3, 4], 0) == []
    end

    test "P(4, 5)" do
      assert permutation([1, 2, 3, 4], 5) == []
    end
  end

  describe "combine" do
    test "C(3, 1)" do
      assert combination([1,2,3], 1) == [[1], [2], [3]]
    end

    test "C(3, 2)" do
      assert combination([1,2,3], 2) == [[1, 2], [1, 3], [2 ,3]]
    end

    test "C(3, 3)" do
      assert combination([1,2,3], 3) == [[1, 2, 3]]
    end

    test "C(4, -1)" do
      assert combination([1, 2, 3, 4], -1) == []
    end

    test "C(4, 0)" do
      assert combination([1, 2, 3, 4], 0) == []
    end

    test "C(4, 1)" do
      assert combination([1, 2, 3, 4], 1) == [[1], [2], [3], [4]]
    end

    test "C(4, 2)" do
      assert combination([1, 2, 3, 4], 2) == [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
    end

    test "C(4, 3)" do
      assert combination([1, 2, 3, 4], 3) == [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
    end

    test "C(4, 4)" do
      assert combination([1, 2, 3, 4], 4) == [[1, 2, 3, 4]]
    end

    test "C(4, 5)" do
      assert combination([1, 2, 3, 4], 5) == []
    end
  end
end
