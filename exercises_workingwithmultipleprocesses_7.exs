# Exercise: WorkingWithMultipleProcesses-7

# Change the ^pid in pmap to _pid. This means that the receive block 
# will take responses in the order the processes send them. Now run 
# the code again. Do you see any difference in the output? If you’re 
# like me, you don’t, but the program clearly contains a bug. Are you
# scared by this? Can you find a way to reveal the problem 
# (perhaps by passing in a different function, or by sleeping, 
# or increasing the number of processes)? Change it back
# to ^pid and make sure the order is now correct.

import :timer, only: [ sleep: 1 ]

defmodule Parallel do
	def pmap(collection, fun) do
		me = self
			
			collection
		|>
			Enum.map(fn (elem) ->
			spawn_link fn -> (send me, { self, fun.(elem) }) end
			end)
		|>
			Enum.map(fn (pid) ->
			receive do { ^pid, result } -> result end
			end)
	end
end


squares = Parallel.pmap 1..10, fn (x) -> 
																	sleep 10 - x
																	x * x 
															 end
IO.puts "squares == #{inspect squares}"

