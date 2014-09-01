# Exercise: ListsAndRecursion-6

# (Harder) Write a function flatten(list) that takes a list that may contain 
# any number of sublists, and those sublists may contain sublists, to any 
# depth.
# It returns the elements of these lists as a flat list.

# iex> MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
# [1,2,3,4,5,6]

# Hint: You may have to use Enum.reverse to get your result in the correct order.

defmodule MyList do
	def flatten(list_of_lists) do
		_flatten(list_of_lists, [])
		|> Enum.reverse
	end

	def _flatten([], accum_list) do
		accum_list
	end

	def _flatten(int, _) when is_integer(int) do
		[int]
	end

	def _flatten([head|tail], accum_list) do
		new_list = _flatten(head,[])
		_flatten(tail, new_list ++ accum_list)
		# ["testing"]
	end
	
end

IO.puts "\n[1, 2, 3, 4, 5, 6] == #{inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])}"
IO.puts "[1, 2, 3] == #{inspect MyList.flatten([1, [[2], 3]])}"


