# Exercise: StringsAndBinaries-7

# The Lists chapter had an exercise about calculating sales tax on page 
# 106.
# We now have the sales information in a file of comma-separated id, 
# ship _to, and amount values. The file looks like this: 

# id,ship_to,net_amount 
# 123,:NC,100.00 
# 124,:OK,35.50
# 125,:TX,24.00
# 126,:TX,44.80
# 127,:NC,25.00
# 128,:MA,10.00
# 129,:CA,102.00
# 120,:NC,50.00

# Write a function that reads and parses this file, and then passes the 
# result to the sales tax function. Remember that the data should be
# formatted into a keyword list, and that the fields need to be the correct
#  types (so the id field is an integer, and so on).
# You’ll need the library functions File.open, IO.read(file, :line), 
# and IO.stream(file).

tax_rates = [ NC: 0.075, TX: 0.08 ]

{ :ok, file } = File.open("tax_file.csv")

IO.puts "First line: #{IO.read(file, :line)}"

fnc = fn(line) ->
		IO.puts line
	  end

# Enum.each IO.stream(file, :line), fnc
lines = File.open!("tax_file.csv")
|> IO.stream(:line)
|> Enum.map(&String.rstrip/1)

# lines
# |> Enum.map(&("#{inspect &1}\n"))
# |> IO.puts

defmodule Parser do
	def convert_string_lines_to_orders_list(lines) do
		parse(lines)
	end

	def parse([]) do
		[]
	end

	def parse([head| tail]) do
		[_id , _ship_to , _net_amount] = String.split(head,",")
		
		_id = String.to_integer(_id)
		_ship_to = String.to_atom(String.slice(_ship_to,1,String.length(_ship_to)-1))
		_net_amount = String.to_float(_net_amount)

		IO.puts " _id == #{_id}"
		IO.puts " _ship_to == #{_ship_to}"
		IO.puts " _net_amount == #{_net_amount}"
		parse(tail) ++ [[id: _id, ship_to: _ship_to, net_amount: _net_amount]]
	end
end

orders = Parser.convert_string_lines_to_orders_list(lines)

IO.puts "orders = #{inspect orders}"
# orders = [
# [ id: 123, ship_to: :NC, net_amount: 100.00 ],
# [ id: 124, ship_to: :OK, net_amount: 35.50 ],
# [ id: 125, ship_to: :TX, net_amount: 24.00 ],
# [ id: 126, ship_to: :TX, net_amount: 44.80 ],
# [ id: 127, ship_to: :NC, net_amount: 25.00 ],
# [ id: 128, ship_to: :MA, net_amount: 10.00 ],
# [ id: 129, ship_to: :CA, net_amount: 102.00 ],
# [ id: 120, ship_to: :NC, net_amount: 50.00 ] ]

defmodule Calculate do
	def calculate_sales_tax(tax_rates, orders) do
		hdict = convert_orders_to_state_dict(orders)

		orders_with_new_total =
		for state <- Dict.keys(hdict) do

			tax_rate_for_curr_state = Keyword.get(tax_rates, state)
			tax_rate_for_curr_state = if (tax_rate_for_curr_state != nil) do
																	tax_rate_for_curr_state
																else
																	0
																end
			order_list = HashDict.get(hdict, state)
			for order <- order_list do
				 net_amount = Keyword.get(order, :net_amount)
				 net_with_tax_amount = net_amount + net_amount * tax_rate_for_curr_state
				 Keyword.put(order, :total_amount, net_with_tax_amount)
		  end
		end
		remove_extra_parenthesis(orders_with_new_total)
	end

	def remove_extra_parenthesis([head|[]]), do: head

	def remove_extra_parenthesis([head|tail]) do
		lst = for order <- head do
						order
					end
		lst ++ remove_extra_parenthesis(tail)					
	end
	

	def convert_orders_to_state_dict(lst) do
		create_state_hash_dict_fnc = fn(order=[_,ship_to, _], hdict) -> 
			HashDict.update(hdict, Enum.at(Tuple.to_list(ship_to),1), [order], &([order|&1]))
		end

		Enum.reduce(lst, HashDict.new, create_state_hash_dict_fnc)	
	end
end

IO.puts "Calculate.calculate_sales_tax(tax_rates, orders) == #{inspect Calculate.calculate_sales_tax(tax_rates, orders)}"
