defmodule MyProcess do
  def token do
    receive do
      {sender, str} ->
        send sender, { :ok, "Hello #{str}"}
    end
  end
end

pid1 = spawn(MyProcess, :token, [])
send pid1, {self(), "fred"}
receive do
  {:ok, str} ->
    IO.puts str
end

pid2 = spawn(MyProcess, :token, [])
send pid2, {self(), "betty"}
receive do
  {:ok, str} ->
    IO.puts str
end
