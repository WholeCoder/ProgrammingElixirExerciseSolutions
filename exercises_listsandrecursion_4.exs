# Exercise: ListsAndRecursion-4

# Write a function MyList.span(from, to) that returns a list of the numbers
# from from up to to.

defmodule MyList do
	def span(from, to) when from == to do
		[to]
	end

	def span(from, to) do
		[from | span(from+1, to)]
	end
end

IO.puts "MyList.span(5, 50) == #{inspect MyList.span(5, 50)}"
