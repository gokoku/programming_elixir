defmodule MyIo do
  def ok!(call) do
    case call do
      {:ok, data} -> data
      { _, data} -> raise "*** error : #{data}"
    end
  end
end