defmodule BowlingGameTest do
  use ExUnit.Case
  doctest BowlingGame

  describe "Score" do
    test "Gutter game results in score of zero" do
      assert 0 == BowlingGame.score([])
    end

    test "One-pin game results in score of twenty" do
      assert 20 == BowlingGame.score(repeat(1))
    end

    test "Spare adds next roll to score" do
      assert 16 == BowlingGame.score([5, 5, 3])
    end

    test "Strike adds next two rolls to score" do
      assert 28 == BowlingGame.score([10, 5, 4])
    end

    test "Perfect game" do
      assert 300 == BowlingGame.score(repeat(10))
    end
  end

  describe "Frames" do
    test "No rolls results in no frames" do
      assert [] == BowlingGame.frames([])
    end

    test "One roll results in one frame" do
      assert [[1]] == BowlingGame.frames([1])
    end

    test "Two rolls results in one frame" do
      assert [[1, 2]] == BowlingGame.frames([1, 2])
    end

    test "Three rolls results in one frame" do
      assert [[1, 2], [3]] == BowlingGame.frames([1, 2, 3])
    end

    test "Spare adds next roll to frame" do
      assert [[5, 5, 4], [4]] == BowlingGame.frames([5, 5, 4])
    end

    test "Strike adds next two rolls to frame" do
      assert [[10, 5, 4], [5, 4]] == BowlingGame.frames([10, 5, 4])
    end
  end

  defp repeat(number) do
    1..100
    |> Stream.map(fn _ -> number end)
    |> Enum.to_list()
  end
end
