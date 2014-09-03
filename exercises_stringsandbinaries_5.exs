# Exercise: StringsAndBinaries-5

# Write a function that takes a list of Strings and prints each on a
# separate line, centered in a column which is the width of the longest. 
# Make sure it works with UTF characters.

# iex> center(["cat", "zebra", "elephant"])
#   cat
#  zebra
# elephant

defmodule Center do
	def center(list) do
		longest_string_length = 
		Enum.reduce(list,0, fn(x, acc) -> 
													  	cond do
														  	String.length(x) > acc -> String.length(x)
															  true -> acc
														  end
												end)
		_center(list, longest_string_length)
	end

	def _center([], _) do
		:ok
	end
	
	def _center([head|tail], longest_string_length) do
		{num_of_spaces, _} = Integer.parse(Float.to_string(longest_string_length/2-String.length(head)/2))
		IO.puts String.duplicate(" ",num_of_spaces)
						<> head
		_center(tail, longest_string_length)
	end
end

list = ["cat", "zebra", "elephant"]
IO.puts "list == #{inspect list}\n"

Center.center(list)
