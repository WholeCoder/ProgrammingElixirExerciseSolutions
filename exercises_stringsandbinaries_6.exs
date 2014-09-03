# Exercise: StringsAndBinaries-6

# Write a function to capitalize the sentences in a string. Each sentence
# is terminated by a period and a space. Right now, the case of the 
# characters in the string is random.

# iex> capitalize_sentences("oh. a DOG. woof. ")
# "Oh. A dog. Woof. "

defmodule Capitalize do
	def capitalize_sentences(<<>>) do
		""
	end

	def capitalize_sentences(sentence) do
		{tail, first_sentence} = next_word(sentence)
		cap(first_sentence) <> capitalize_sentences(tail)
	end

	def cap("") do
		""
	end
	

	def cap(sentence=<<head :: utf8, tail :: binary>>) do

		if (<<head>> == " ") do
			" " <> cap(tail)
		else
			first_letter = String.slice(sentence, 0, 1)
	                      |> String.upcase
	    if (String.length(sentence) < 2) do
	    	first_letter
	    else
	    	first_letter <> String.downcase(String.slice(sentence, 1, String.length(sentence)-1))
	    end
	  end
	end
	
	def next_word(<< head :: utf8, tail :: binary >>) 
	when <<head>> == "." do
		{tail, "."}
	end

	def next_word(word) 
	when word == "" or word == " " do
		{"", ""}
	end

	def next_word(<< head :: utf8, tail :: binary >>) do
		{resttail, reststring} = next_word(tail)
		{resttail, <<head>> <> reststring}
	end

end

sentence = "oh. a DOG. woof. "
IO.puts "\n#{sentence} == #{Capitalize.capitalize_sentences(sentence)}"

sentence = "Oh. A dog. Woof. "
IO.puts "#{sentence} == #{Capitalize.capitalize_sentences(sentence)}"

sentence = "Oh. A dog. "
IO.puts "#{sentence} == #{Capitalize.capitalize_sentences(sentence)}"

sentence = "A dog. "
IO.puts "#{sentence} == #{Capitalize.capitalize_sentences(sentence)}"
