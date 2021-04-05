defmodule MyList do
  def caesar([], _), do: []
  def caesar([ head | tail ], n) do
    [ rem(head - 97 + n, 26) + 97 | caesar(tail, n)]
  end
end