# Exercise: ModulesAndFunctions-3 Add a quadruple function. (Maybe it could 
# 	call the double function….)

defmodule Times do
	def double(n) do
		n * 2
	end

	def triple(n) do
		n * 3
	end

	def quadruple(n) do
		double(double(n))
	end
	
end

IO.puts "Times.double(3) == #{Times.double(3)}"
IO.puts "Times.triple(3) == #{Times.triple(3)}"
IO.puts "Times.quadruple(3) == #{Times.quadruple(3)}"
