# Exercise: Functions-2
# Write a function that takes three arguments. If the first two are zero,
# return “FizzBuzz”. If the first is zero, return “Fizz”. If the second is zero
# return “Buzz”. Otherwise return the third argument. Do not use any language
# features that we haven’t yet covered in this book.

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
		third
	end
	
end

IO.puts "FizzBuzz.fizz(0,0,\"test\") == #{FizzBuzz.fizz(0,0,"test")}"

IO.puts "FizzBuzz.fizz(0,1,\"test\") == #{FizzBuzz.fizz(0,1,"test")}"

IO.puts "FizzBuzz.fizz(1,0,\"test\") == #{FizzBuzz.fizz(1,0,"test")}"


