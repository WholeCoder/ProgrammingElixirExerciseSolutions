# Exercise: ModulesAndFunctions-1 Extend the Times 
# module with a triple function, that multiplies its 
# parameter by three.

defmodule Times do
	def double(n) do
		n * 2
	end

	def triple(n) do
		n * 3
	end
	
end

IO.puts "Times.double(3) == #{Times.double(3)}"
IO.puts "Times.triple(3) == #{Times.triple(3)}"
