defmodule MyLink do
  import :timer, only: [ sleep: 1 ]

  def all_receive do
    receive do
      message ->
        IO.puts "MESSAGE: #{message}"
        all_receive()
    after 1000 ->
      IO.puts "ALL RECEIVED"
    end
  end


  def run do
    spawn_link(MyLink, :child, [self()])
    sleep(500)
    all_receive()
  end

  def child(parent) do
    send parent, "Finished"
  end
end

MyLink.run