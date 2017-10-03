defmodule Quick do
  def sort([]), do: []
  def sort([x | xs]) do
    { lhs, rhs } = Enum.partition(xs, &(&1 < x))
    sort(lhs) ++ [x] ++ sort(rhs)
  end
end
