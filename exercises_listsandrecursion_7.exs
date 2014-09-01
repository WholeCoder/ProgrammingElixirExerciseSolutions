# Exercise: ListsAndRecursion-7

# In the last exercise of the Lists and Recursion chapter, you wrote a span
# funtion. Use it and list comprehensions to return a list of the prime
# numbers from 2 to n.

defmodule MyList do
	def span(from, to) when from == to do
		[to]
	end

	def span(from, to) do
		[from | span(from+1, to)]
	end
end

defmodule Primes do
	def get_primes_up_to(n) do
		[2] ++ for x <- MyList.span(2,n), Enum.all?(2..(x-1),fn(y) -> rem(x, y) != 0 end), do: x
	end
end

IO.puts "primes up to 50 == #{inspect Primes.get_primes_up_to(50)}"



