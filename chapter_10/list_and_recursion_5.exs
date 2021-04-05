defmodule MyEnum do
  #
  # all?
  #
  def all?([], _), do: true
  def all?([head | tail], cond) do
    if cond.(head) do
      true and all?(tail, cond)
    else
      false
    end
  end

  #
  # each
  #
  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  #
  # filter
  #
  def filter([], _), do: []
  def filter([head | tail], cond) do
    if cond.(head) do
      [ head | filter(tail, cond) ]
    else
      filter(tail, cond)
    end
  end

  #
  # split
  #
  def split(list, n) when n < length(list) do
    { _pre(list, 0, n), _rest(list, n, length(list)) }
  end
  def split(list, _), do: { list, [] }

  defp _pre( _, y, y), do: []
  defp _pre([head | tail], x, y), do: [ head | _pre(tail, x+1, y) ]
  defp _rest(list, 0, n) when n > 0, do: list
  defp _rest([_head | tail], n, m), do: _rest(tail, n-1, m-1)

  #
  # take
  #
  def take(list, n) when n < length(list) do
    _take(list, n)
  end
  def take(list, _), do: list
  defp _take(_, 0), do: []
  defp _take([head | tail], n), do: [ head | _take(tail, n-1)]
end