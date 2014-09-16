# Exercise: Nodes-3

# Alter the code so that successive ticks are sent to each registered 
# client (so the first goes to the first client, the second the next 
# client, and so on). Once the last client receives a tick, it 
# starts back at the first. The solution should deal with new clients 
# being added at any time.

defmodule Ticker do

  @interval 2000   # 2 seconds

  @name  :ticker

  def start do
    pid = spawn(__MODULE__, :start_distributing, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def start_distributing(clients) do
  	distributing_generator(clients, clients)
  end
  
  def distributing_generator([], []) do
		receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        distributing_generator([pid], [pid])
    end
  end
  
  def distributing_generator([], clients) do
  	distributing_generator(clients, clients)
  end

  def distributing_generator([cur_client| rest_of_clients], clients_main_list) do 
  	receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        distributing_generator(rest_of_clients, Enum.reverse([pid|Enum.reverse(clients_main_list)]))

    after
      @interval ->
        IO.puts "tick in distribution"
        send cur_client, { :tick }
        distributing_generator(rest_of_clients, clients_main_list)
    end
  end
end

defmodule Client do

  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        receiver
    end
  end
end
