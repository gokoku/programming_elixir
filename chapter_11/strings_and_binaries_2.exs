defmodule MyParse do

  def anagram?([], str), do: length(str) == 0
  def anagram?([head | tail], word2) do
    str = _contains?(head, word2, [])
    anagram?(tail, str)
  end

  defp _contains?(_, [], list), do: list
  defp _contains?(c, [head | tail], list)
  when c == head, do: _contains?(c, [], list ++ tail)
  defp _contains?(c, [head | tail], list), do: _contains?(c, tail, list ++ [head])
  end