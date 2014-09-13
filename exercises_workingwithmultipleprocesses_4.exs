# Exercise: WorkingWithMultipleProcesses-4

# Do the same, but have the child raise an exception. What 
# difference do you see in the tracing.

import :timer, only: [ sleep: 1 ]

defmodule SpLink do
	def echo(parent_pid) do
		send parent_pid, "a message"
		raise "An Error"
	end
end

spawn_link(SpLink, :echo, [self])
sleep 500
receive do
	message ->
    IO.puts "got message == #{message}"
end

