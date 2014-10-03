
defmodule Stack.Server do
  use GenServer

  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end
  
  def push(element) do
    GenServer.cast __MODULE__, {:push, element}
  end
  
  def handle_call(:pop, _from, [head | rest]) do
    { :reply, head, rest}
  end

  def handle_cast({:push, element}, current_stack) do
    if element < 10 do
      System.halt(-1)
    end
    { :noreply, [element | current_stack]}
  end
  
  def terminate(_reason, {current_stack, stash_pid}) do
    Stack.Stash.save_value stash_pid, current_stack
  end
end