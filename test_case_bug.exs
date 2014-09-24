func = fn -> 0 end

case func.() do
	0 -> IO.puts "Zero!"
	1 -> IO.puts "One"
end