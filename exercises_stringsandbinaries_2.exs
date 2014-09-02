# Exercise: StringsAndBinaries-2
# Write anagram?(word1, word2) that returns true if its parameters are anagrams.

defmodule Anagram do

	def anagram?([], []) do
		true
	end

	def anagram?([], [head2| _])
	when head2 != nil do
		false
	end

	def anagram?([head|tail], word2) do
		if head in word2 do
			anagram?(tail, List.delete(word2, head))
		else
			false
		end
	end
end

w1 = 'torchwood'
w2 = 'doctorwho'

IO.puts "Anagram.anagram?('#{w1}', '#{w2}') == #{Anagram.anagram?(w1,w2)}"