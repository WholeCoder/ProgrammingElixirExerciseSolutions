# Exercise: Functions-4

# Write a function prefix that takes a string. It should return a new 
# function that takes a second string. When that second function is 
# called, it will return a string containing the first string, 
# a space, and the second string.

prefix = fn str -> 
				fn second_string ->
					str <> " " <> second_string
				end
		 end

IO.puts prefix.("test").("test2")