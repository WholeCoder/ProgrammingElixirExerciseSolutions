# Exercise: ListsAndRecursion-2

# Write max(list) that returns the element with the maximum value in the
# list. (This is slightly trickier than it sounds.)

defmodule MyList do
	def max([head|[]]) do
		head
	end
	
	def max([head | tail]) do
		if head > max(tail) do
			head
		else
			max(tail)
		end
	end
end

IO.puts "5 == #{MyList.max([5,-10,3])}"