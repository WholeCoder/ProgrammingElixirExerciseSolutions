defmodule FinancialSummary do

	@second_column_width 20
	@total_available_dollars_per_month 1280

	def second_column_width, do: @second_column_width
	def total_available_dollars_per_month, do: @total_available_dollars_per_month


	def sum_up_values_into_hash_dict(lst) do

		create_sums_in_a_hash_dict_fnc = fn({key, value}, hdict) -> 
			HashDict.update(hdict, key, String.to_integer(value), &(&1+String.to_integer(value)))
		end

		Enum.reduce(lst, HashDict.new, create_sums_in_a_hash_dict_fnc)	
	end

	def get_total(hdict) do
		hdict
		|> Dict.values
		|> Enum.sum
	end
end

map = File.open!("finances_september_2014.csv")
	|> IO.stream(:line)
	|> Enum.map(&String.strip/1)
	|> Enum.map(&(String.split(&1,",")))

tuples = map
		 |> Enum.map(&List.to_tuple/1)

financial_dict = FinancialSummary.sum_up_values_into_hash_dict(tuples)
financial_list = HashDict.to_list(financial_dict)
financial_list_reversed = Enum.reverse(List.keysort(financial_list,1))

print_finance_items_fnc = fn({k,v}) ->
		kstring = "#{k}"
		vstring = String.rjust("#{v}",20-String.length(kstring))
		IO.puts "#{kstring}#{vstring}"
	  end

IO.puts "\n"
Enum.each(financial_list_reversed, print_finance_items_fnc)

tot = FinancialSummary.get_total(financial_list_reversed)
tstring = Integer.to_string(tot)
					|> String.rjust(FinancialSummary.second_column_width-String.length("total"))

IO.puts "\ntotal#{tstring}\n"


lstring = Integer.to_string(FinancialSummary.total_available_dollars_per_month-tot)
					|> String.rjust(FinancialSummary.second_column_width-String.length("left"))

IO.puts "left#{lstring}"