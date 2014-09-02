# Exercise: StringsAndBinaries-1

# Write a function that returns true if a single-quoted string contains only
# printable ASCII characters (space through tilde).

defmodule Test do

	def test_single_quoted_has_only_my_chars([]) do
		true
	end
	
	def test_single_quoted_has_only_my_chars([head|tail]) do
		range = ?\s..?~
		(head in range) and test_single_quoted_has_only_my_chars(tail)
	end
	
end

# '\x1F'
IO.puts "test == <#{inspect Test.test_single_quoted_has_only_my_chars('te~ st')}>"
