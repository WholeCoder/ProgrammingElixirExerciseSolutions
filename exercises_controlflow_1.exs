# Exercise: ControlFlow-1
# Rewrite the FizzBuzz example using case.

## old
defmodule FizzBuzz2 do
	def upto(n) when n > 0 do
		1..n |> Enum.map(&fizzbuzz/1)
	end
	defp fizzbuzz(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
	defp fizzbuzz(n) when rem(n, 3) == 0, do: "Fizz"
	defp fizzbuzz(n) when rem(n, 5) == 0, do: "Buzz"
	defp fizzbuzz(n), do: n
end
###############

defmodule FizzBuzz do
	def upto(n) when n > 0 do
		1..n |> Enum.map(&fizzbuzz/1)
	end
	
	defp fizzbuzz(n) do
		var = case find_factor(n) do
						15 -> "FizzBuzz"
						3 -> "Fizz"
						5 -> "Buzz"
						-1 -> n
					end
		var
	end

	def find_factor(n) do
		remn3 = rem(n, 3)
		remn5 = rem(n, 5)
		remn35 = remn3 + remn5
		if remn3 == 0 do
			if remn5 == 0 do
				15
			else
				3
			end
		else
			if remn5 == 0 do
				5
			else
				-1
			end
		end
	end
	
end


IO.puts("#{inspect FizzBuzz2.upto(15)} == #{inspect FizzBuzz.upto(15)}")
