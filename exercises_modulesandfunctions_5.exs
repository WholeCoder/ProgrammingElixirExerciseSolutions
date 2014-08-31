# Exercise: ModulesAndFunctions-5 

# Write a function gcd(x,y) that finds the greatest
# common divisor between two nonnegative integers. Algebraically, gcd(x,y) is x 
# if y is zero, gcd(y, rem(x,y)) otherwise.


defmodule GCD do
	def gcd(x,0) do
		x
	end
	
	def gcd(x,y) do
		gcd(y, rem(x,y))
	end
end

IO.puts "GCD.gcd(10,5) == #{GCD.gcd(10,5)}"
