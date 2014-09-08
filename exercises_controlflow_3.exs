# Exercise: ControlFlow-3

# Many built-in functions have two forms. The xxx form returns the 
# tuple {:ok, data} and the xxx! form returns data on success but 
# raises an exception otherwise. However, there are some functions 
# that don’t have the xxx! form.

# Write a function ok! that takes an arbitary parameter. If the 
# parameter is the tuple {:ok, data} return the data. Otherwise raise
# an exception containing information from the parameter. You 
# could use your function like this: 

# file = ok! File.open("somefile")

defmodule Test do
	def ok!({:ok, data}) do
		data
	end

	def ok!(other) do
		raise "#{inspect other}"
	end
end

file = Test.ok! File.open("finances_september_2014.csv")
IO.puts("file == #{inspect file}")