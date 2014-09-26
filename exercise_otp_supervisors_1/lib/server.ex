# Exercise: OTP-Supervisors-1

# Add a supervisor to your stack application. Use iex 
# to make sure it starts the server correctly. Use the 
# server normally, and then crash it (try popping from 
# an empty stack). Did it restart? What was the stack
# contents after the restart?

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
	
	def terminate(reason, state) do
		IO.puts "terminated Stack.Server - reason == #{inspect reason}"
		IO.puts "		state == #{inspect state}"
	end
	
end