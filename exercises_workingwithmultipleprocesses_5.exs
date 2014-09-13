# Exercise: WorkingWithMultipleProcesses-5

# Repeat the two, changing spawn_link to spawn_monitor.

import :timer, only: [ sleep: 1 ]

defmodule SpLink do
	def echo(parent_pid) do
		send parent_pid, "a message"
	end
end

spawn_monitor(SpLink, :echo, [self])
sleep 500
receive do
	message ->
    IO.puts "got message == #{message}"
end

IO.puts "spawn_monitor with exception"
defmodule SpLink2 do
	def echo(parent_pid) do
		send parent_pid, "a message"
		raise "An Error"
	end
end

spawn_link(SpLink2, :echo, [self])
sleep 500
receive do
	message ->
    IO.puts "got message == #{message}"
end







