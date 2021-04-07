defmodule MyParse do
  def printable(str), do: _printable?(str, true)

  defp _printable?([], value), do: value
  defp _printable?([ head | tail ], value)
    when head >= ?\s and head <= ?~, do: _printable?(tail, value and true)
  defp _printable?([ _ | _ ], _), do: _printable?([], false)
end