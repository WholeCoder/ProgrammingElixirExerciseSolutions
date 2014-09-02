# Exercise: StringsAndBinaries-2
# Write anagram?(word1, word2) that returns true if its parameters are anagrams.

defmodule Anagram do

	def anagram?([], []) do
		true
	end

	def anagram?([], word2)#[head2| _]
	when word2 != [] do
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

w1 = 'doctorwho'
w2 = 'torchwood'

IO.puts "Anagram.anagram?('#{w1}', '#{w2}') == #{Anagram.anagram?(w1,w2)}"