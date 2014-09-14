# Exercise: WorkingWithMultipleProcesses-9 

# Use the same server code, 
# but instead run a function that finds the number of times the word 
# “cat” appears in each file in a given directory. Run one server 
# process per file. The function File.ls! returns the names of files 
# in a directory, and File.read! reads the contents of a file as a 
# binary. Run your code on a directory with a reasonable number of 
# files (maybe 100 or so) so you can experiment with the effects of 
# concurrency.

import :timer, only: [ sleep: 1 ]

defmodule FindCat do
	def fib(scheduler) do
		send scheduler, {:ready, self}
		receive do
			{:fib, filename, client} ->
		    send client, {:answer, filename, count_cat_in_file(filename), self}
		    fib(scheduler)
		  {:shutdown } ->
		  	exit(:normal)
		end
	end
	
	def count_cat_in_file(file_name) do
		file_text = File.read!("./cat_files/" <> file_name)
		# IO.puts "file_name == #{file_name}"
		# IO.puts "file_text == #{inspect file_text}"
		cat_list = Regex.scan(~r/cat/, file_text)
		# IO.puts "cat_list == #{inspect cat_list}"
		cat_count = Enum.count(cat_list)
		# IO.puts "cat_count == #{inspect cat_count}"
		# sleep 4
	end
	
end

# IO.puts "File.ls! == #{inspect File.ls!("./cat_files")}"


defmodule Scheduler do
	def run(num_processes, module, func, to_calculate) do
		(1..num_processes)
			|> Enum.map(fn(_) -> spawn(module, func, [self]) end)
			|> schedule_processes(to_calculate, [])
	end

	defp schedule_processes(processes, queue, results) do

		receive do
			{:ready, pid} when length(queue) > 0 ->
				[ next | tail ] = queue
				send pid, {:fib, next, self}
				schedule_processes(processes, tail, results)
			{:ready, pid} ->
				send pid, {:shutdown}
				if length(processes) > 1 do
					schedule_processes(List.delete(processes, pid), queue, results)
				else
					Enum.sort(results, fn {n1,_}, {n2,_} -> n1 <= n2 end)
				end
			{:answer, number, result, _pid} ->
				schedule_processes(processes, queue, [ {number, result} | results ])
		end
	end
end

to_process = File.ls!("./cat_files")#[ 37, 37, 37, 37, 37, 37 ]
Enum.each 1..10, fn num_processes ->
					{time, result} = :timer.tc(Scheduler, :run,
						[num_processes, FindCat, :fib, to_process])

					if num_processes == 1 do
						IO.puts inspect result
						IO.puts "\n # time (s)"
					end
					:io.format "~2B ~.2f~n", [num_processes, time/1000000.0]
				 end
