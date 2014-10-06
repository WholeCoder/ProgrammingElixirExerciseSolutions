defmodule Stack do
  use Application

  def start(_type, initial_stack) do
    IO.puts "Starting supervisor-------------"
    Stack.Supervisor.start_link(initial_stack)
  end
end
