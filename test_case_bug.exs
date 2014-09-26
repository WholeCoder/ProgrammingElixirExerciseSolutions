func = fn -> 0 end
var = 15
case true do
	rem(var,5)+rem(var,3) == 0 -> IO.puts "5 and 3"
	rem(var,5) == 0  -> IO.puts "five"
	rem(var,3) == 0  -> IO.puts "three"
end