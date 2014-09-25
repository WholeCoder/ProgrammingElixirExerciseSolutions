# Exercise: Nodes-4

# The ticker process in this chapter is a central server that sends 
# events to registered clients. Reimplement this as a ring of clients. 

# A client sends a tick to the next client in the ring. After 2 seconds, 
# that next client sends a tick to its next client. When thinking about 
# how to add clients to the ring, remember to deal with the case where 
# a client’s receive loop times out just as you’re adding a new process. 

# What does this say about who has to be responsible for updating the 
# links?

import :timer, only: [ sleep: 1 ]

defmodule Ticker do
	@interval 2000

	@name :ticker

  def start do
    pid = spawn(__MODULE__, :start_distributing, [[]])
    :global.register_name(@name, pid)
    pid
  end

  def start_distributing(client_list) do
  	receive do
  		{:register, client_pid} ->
  	    start_distributing([client_pid | client_list])
  	  {:start_chain} ->
  	  	[first | rest] = client_list
  	  	send first, {:tick, rest, client_list}
  	  	start_distributing(client_list)
  	end
  end
  

  def start_chain do
    send :global.whereis_name(@name), { :start_chain}
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

end

defmodule Client do
	@interval 2000

  def start do
    pid = spawn(__MODULE__, :start_rec, [])
    # :global.register_name(@name, pid)
    pid
  end

  # def register(client_pid) do
  #   send :global.whereis_name(@name), { :register, client_pid }
  # end

	def start_rec do
		receive do
			{:tick, [next_pid | rest], client_list} ->
				IO.puts "tick #{inspect self}"
				sleep @interval
		    send next_pid, { :tick, rest, client_list}
		    start_rec

		  {:tick, [], client_list} ->
		  # 	[first | rest] = client_list
				# sleep @interval
		  # 	send first, {:tick, rest, client_list}
				IO.puts "tick #{inspect self}"
				sleep @interval
    		send :global.whereis_name(:ticker), { :start_chain }
		  	start_rec
		end
	end

end
