# Exercise: StringsAndBinaries-4

# (Harder) Write a function that takes a single-quoted string of the 
# form number [+-*/] number and returns the result of the calculation.

# The individual numbers do not have leading plus or minus signs.
# calculate('123 + 27') # => 150

defmodule Converter do
	def convert_from_list_to_integer(equation) do
		{tail, left_number} = _convert_from_list_to_integer(equation)
		{optail, operator} = get_operator(tail)
		{_, right_number} = _convert_from_list_to_integer(optail)

		case operator do
			'+' -> left_number + right_number
			'/' -> left_number / right_number
			'*' -> left_number * right_number
			'-' -> left_number - right_number
		end
	end

	def get_operator([head, _space | tail]) do
		{tail ++ ' ', [head]}
	end

	def _convert_from_list_to_integer([?\x20|tail]) do
		# head - ?0
		{tail, 0}
	end

	def _convert_from_list_to_integer([head|tail]) do
		num_of_zeroes = Enum.find_index(tail, fn(x) -> x == ?\x20 end)
		{resttail,restnum} = _convert_from_list_to_integer(tail)
		number = (head - ?0)*calculate_place(num_of_zeroes) + restnum
		{resttail, number}
	end

	def calculate_place(count) when count <= 0 do
		1
	end

	def calculate_place(count) when count > 0 do
		10*calculate_place(count-1)
	end
end

num = '123 + 111'
IO.puts "\nConverter.convert_from_list_to_integer('#{num}') == #{Converter.convert_from_list_to_integer(num)}"
num = '123 - 111'
IO.puts "Converter.convert_from_list_to_integer('#{num}') == #{Converter.convert_from_list_to_integer(num)}"
num = '123 * 111'
IO.puts "Converter.convert_from_list_to_integer('#{num}') == #{Converter.convert_from_list_to_integer(num)}"
num = '123 / 111'
IO.puts "Converter.convert_from_list_to_integer('#{num}') == #{Converter.convert_from_list_to_integer(num)}\n"