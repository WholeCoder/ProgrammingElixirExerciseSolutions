# Exercise: WorkingWithMultipleProcesses-2

# Write a program that spawns two processes, and then passes 
# each a unique token (for example “fred” and “betty”). Have them send 
# the tokens back.

# – Is the order that the replies are received deterministic in 
# theory? In
# practice?
# – If either answer is no, how could you make it so?

defmodule TwoProcs do
	def echo(token) do
		receive do
			{:message, send_back_pid} ->
		    	send send_back_pid, "sent this back:  " <> token
		end
	end
end

first_process_pid = spawn(TwoProcs, :echo, ["fred"])
second_process_pid = spawn(TwoProcs, :echo, ["betty"])

send first_process_pid, {:message, self}
send second_process_pid, {:message, self}

receive do
	token ->
    IO.puts "token == #{token}"
end

receive do
	token ->
    IO.puts "token == #{token}"
end
