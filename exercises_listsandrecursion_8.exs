# Exercise: ListsAndRecursion-8

# Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC),
# so we have to charge sales tax on orders shipped to these states. The
# rates can be expressed as a keyword list2

# Write a function that takes both lists and returns a copy of the orders,
# but with an extra field, total_amount which is the net plus sales tax.
# If a shipment is not to NC or TX, there’s no tax applied.

tax_rates = [ NC: 0.075, TX: 0.08 ]

# Here’s a list of orders:
orders = [
[ id: 123, ship_to: :NC, net_amount: 100.00 ],
[ id: 124, ship_to: :OK, net_amount: 35.50 ],
[ id: 125, ship_to: :TX, net_amount: 24.00 ],
[ id: 126, ship_to: :TX, net_amount: 44.80 ],
[ id: 127, ship_to: :NC, net_amount: 25.00 ],
[ id: 128, ship_to: :MA, net_amount: 10.00 ],
[ id: 129, ship_to: :CA, net_amount: 102.00 ],
[ id: 120, ship_to: :NC, net_amount: 50.00 ] ]


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
