
defmodule FizzBuzz do
	def fizz(0, 0, _) do
		"FizzBuzz"
	end

	def fizz(0,_, _) do
		"Fizz"
	end
	
	def fizz(_, 0, _) do
		"Buzz"
	end
	
	def fizz(_, _, third) do
		Integer.to_string(third)
	end
	
end


# Exercise: Functions-3

# The operator rem(a, b) returns the remainder after dividing a by b. 
# Write a function that takes a single integer (n) and which calls 
# the function in the previous exercise, passing it rem(n,3), 
# rem(n,5), and n. Call it 7 times with the arguments 10, 11, 12, 
# etc. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16”.

# (Yes, it’s a FizzBuzz1 solution with no conditional logic).

defmodule FizzBuzzWithNumbers do
	def fb(n) do
		10..16 
			|> Enum.map(&(FizzBuzz.fizz(rem(&1,3),rem(&1,5),&1))) 
			|> Enum.map(&("#{&1}\n"))
			|> IO.puts
	end
	
end

FizzBuzzWithNumbers.fb(10)

