# Exercise: WorkingWithMultipleProcesses-3

# Use spawn_link to start a process, and have that process send a 
# message to the parent and then exit immediately. Meanwhile, sleep 
# for 500ms in the parent, then receive as many messages as there 
# are waiting. Trace what you receive. Does it matter that you weren’t 
# waiting for the notification from the child at the time it exited?

import :timer, only: [ sleep: 1 ]

defmodule SpLink do
	def echo(parent_pid) do
		send parent_pid, "a message"
	end
end

spawn_link(SpLink, :echo, [self])
sleep 500
receive do
	message ->
    IO.puts "got message == #{message}"
end

