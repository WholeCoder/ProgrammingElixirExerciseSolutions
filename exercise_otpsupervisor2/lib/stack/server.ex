
defmodule Stack.Server do
  use GenServer

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def init(stash_pid) do
    current_stack = Stack.Stash.get_value stash_pid
    { :ok, {current_stack, stash_pid} }
  end

  def crash do
    0 / 0
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end
  
  def push(element) do
    GenServer.cast __MODULE__, {:push, element}
  end
  
  def handle_call(:pop, _from, {[head | rest], stash_pid}) do
    { :reply, head, {rest, stash_pid}}
  end

  def handle_cast({:push, element}, {current_stack, stash_pid}) do
    { :noreply, {[element | current_stack], stash_pid}}
  end
  
  def terminate(_reason, {current_stack, stash_pid}) do
    Stack.Stash.save_value stash_pid, current_stack
  end
end