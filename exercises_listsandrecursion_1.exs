# Exercise: ListsAndRecursion-1

# Write a function mapsum that takes a list and a function. It applies the
# function to each element of the list, and then sums the result, so

# iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
# 14

defmodule MyList do
	def mapsum([], _) do
		0
	end
	
	def mapsum([head | tail], fnc) do
		fnc.(head) + mapsum(tail, fnc)
	end
	
end

IO.puts "14 == #{MyList.mapsum [1, 2, 3], &(&1 * &1)}"
