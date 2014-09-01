# Exercise: ListsAndRecursion-3

# An Elixir single quoted string is actually a list of individual character
# codes. Write a function caesar(list, n) that adds n to each element of the list,
# wrapping if the addition results in a character greater than z.

# iex> MyList.caesar('ryvkve', 13)
# ?????? :)

defmodule MyList do
	def caesar(list, n) do
		for ch <- list do 
			?a+rem(ch+n-?a, ?z-?a+1)
		end
	end
end

IO.puts "MyList.caesar('ryvkve', 13) == #{MyList.caesar('ryvkve', 13)}"