defmodule MyProcess do
  def token do
      betty = spawn(MyProcess, :person, [])
      fred = spawn(MyProcess, :person, [])

      send betty, {self(), "betty"}
      send fred, {self(), "fred"}

    receive do
      {_sender, "betty"} ->
        IO.puts "Betty replied first!"
      {_sender, "fred"} ->
        IO.puts "Fred replied first!"
    end
  end

  def person do
    receive do
      {sender, msg} ->
        IO.puts msg
        send sender, {self(), msg}
    end
  end
end

MyProcess.token
