#---
# Excerpted from "Programming Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/elixir for more book information.
#---
defmodule Sequence.Stash do
  use GenServer
  require Logger

  @vsn "1"

  #####
  # External API  

  def start_link({current_number, delta}) do
    GenServer.start_link( __MODULE__, {current_number, delta}, name: __MODULE__)
  end

  def save_value(pid, value, delta) do
    GenServer.cast pid, {:save_value, {value, delta}}
  end

  def get_value(pid) do
    GenServer.call pid, :get_value
  end

  #####
  # GenServer implementation

  def handle_call(:get_value, _from, {current_value, delta}) do 
    { :reply, {current_value, delta}, {current_value, delta} }
  end

  def handle_cast({:save_value, {current_value, delta}}, _current_value) do
    { :noreply, {current_value, delta}}
  end

  def code_change("0", old_state = current_number, _extra) do
    new_state = { current_number, 
                  1 # default delta
                }
    Logger.info "Changing code from 0 to 1 in update_stash.ex"
    Logger.info inspect(old_state)
    Logger.info inspect(new_state)
    { :ok, new_state }
  end
end
