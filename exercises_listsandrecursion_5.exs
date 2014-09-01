# Exercise: ListsAndRecursion-5

# Implement the following Enum functions using no library functions or
# list comprehensions: all?, each, filter, split, and take. You may need to 
# use an if statement to implement filter. The syntax for this is:

# if condition do
# 	expression(s)
# else
# 	expression(s)
# end

defmodule MyEnum do
	def all?([head| []], fun) do
		fun.(head)		
	end
	
	def all?([head | tail], fun \\ fn x -> x end) do
		fun.(head) and all?(tail, fun)
	end

	def each([head|[]], fun) do
		fun.(head)
	end
	
	def each([head|tail], fun) do
		fun.(head)
		each(tail, fun)
	end
	

	def filter([head|[]], fun) do
		if(fun.(head)) do
			[head]
		else
			[]
		end
	end
	
	def filter([head|tail], fun) do
		if (fun.(head)) do
			[head|filter(tail, fun)]
		else
			filter(tail, fun)
		end
	end
	
	def split(list, count) do
			sphl = split_head_left(list,count)
			sphr = split_head_right(list, count)
			{sphl, sphr}
	end

	def split_head_left(_, 0) do
		[]
	end
	
	def split_head_left([], _) do
		[]
	end
	
	def split_head_left([head|tail], count) do
		if (count > 0) do
			[head| split_head_left(tail,count-1)]
		end
	end
	
	def split_head_right(list,0) do
		list
	end

	def split_head_right([head|tail], count) do
		split_head_right(tail,count-1)
	end

	def split_head_right(list,_) do
		list
	end

	def take(collection, 0) do
		[]
	end

	def take([], _) do
		[]
	end

	def take([head|tail], count) do
		[head|take(tail,count-1)]
	end
end

IO.puts "\ntrue == #{MyEnum.all?([2, 4, 6], fn(x) -> rem(x, 2) == 0 end)}"
IO.puts "false == #{MyEnum.all?([2, 3, 4], fn(x) -> rem(x, 2) == 1 end)}\n\n"

MyEnum.each(["some", "example"], fn(x) -> IO.puts x end)

IO.puts"\n\n[2] == #{inspect MyEnum.filter([1, 2, 3], fn(x) -> rem(x, 2) == 0 end)}"


IO.puts "\n\n{[1, 2], [3]} == #{inspect MyEnum.split([1, 2, 3], 2)}"
IO.puts "{[1, 2, 3], []} == #{inspect MyEnum.split([1, 2, 3], 10)}"
IO.puts "{[], [1, 2, 3]} == #{inspect MyEnum.split([1, 2, 3], 0)}"



IO.puts "\n\n[1, 2] == #{inspect Enum.take([1, 2, 3], 2)}"
IO.puts "[1, 2, 3] == #{inspect Enum.take([1, 2, 3], 10)}"
IO.puts "[] == #{inspect Enum.take([1, 2, 3], 0)}"