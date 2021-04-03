defmodule MyList do

  def max(list), do: _max(list, 0)

  defp _max([], x), do: x
  defp _max([ head | tail ], x) when head > x, do: _max(tail, head)
  defp _max([ _ | tail ], x), do: _max(tail, x)
end
