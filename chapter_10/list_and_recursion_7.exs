defmodule MyList do
  def span(to, to), do: [to]
  def span(from, to) when from < to, do: [from | span(from+1, to)]
  def span(from, to) when from > to, do: [from | span(from-1, to)]

  def prime(n) do
    for x <- span(2, n), _prime?(x), do: x
  end
  defp _prime?(2), do: true
  defp _prime?(n) do
    p = (for x <- span(2, n-1), rem(n, x) == 0, do: x )
        |> length
    p == 0
  end
end