defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], cond) do
    if cond.(head) do
      true and all?(tail, cond)
    else
      false
    end
  end

  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _), do: []
  def filter([head | tail], cond) do
    if cond.(head) do
      [ head | filter(tail, cond) ]
    else
      filter(tail, cond)
    end
  end
end