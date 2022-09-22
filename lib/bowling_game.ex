defmodule BowlingGame do
  def score([_hd | _tail] = rolls) do
    rolls
    |> frames()
    |> Enum.take(10)
    |> List.flatten()
    |> Enum.sum()
  end

  def score(_), do: 0

  def frames([10 | rest] = rolls) do
    [rolls_for_frame(rolls)] ++ frames(rest)
  end

  def frames([_hd | _tail] = rolls) do
    [rolls_for_frame(rolls)] ++ frames(Enum.drop(rolls, 2))
  end

  def frames(_), do: []

  defp rolls_for_frame(rolls) do
    if strike?(rolls) or spare?(rolls),
      do: Enum.take(rolls, 3),
      else: Enum.take(rolls, 2)
  end

  defp strike?(rolls) do
    List.first(rolls) == 10
  end

  defp spare?(rolls) do
    Enum.sum(Enum.take(rolls, 2)) == 10
  end
end
