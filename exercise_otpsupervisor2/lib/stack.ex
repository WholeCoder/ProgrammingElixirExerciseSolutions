defmodule Stack do
  use Application

  def start(_type, _args) do
    IO.puts "Starting supervisor-------------"
    Stack.Supervisor.start_link([99, "Ruben", 9])
  end
end
