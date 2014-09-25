# Exercise: OTP-Servers-1

# You’re going to start creating a server that implements a stack. 

# The call that initializes your stack will pass in a list that is 
# the initial stack contents. For now, only implement the pop interface. 
# It’s acceptable for your server to crash if someone tries to pop from 
# an empty stack. 

# For example, if initialized with [5,"cat",9], successive 
# calls to pop will return 5, "cat", and 9.

defmodule Stack.Server do
	use GenServer

	def handle_call(:pop, _from, [head | rest]) do
		{ :reply, head, rest}
	end

	def handle_cast({:push, element}, current_stack) do
		{ :noreply, [element | current_stack]}
	end
	
end