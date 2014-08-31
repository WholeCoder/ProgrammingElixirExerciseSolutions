# Exercise: ModulesAndFunctions-6
#
# I’m thinking of a number between 1 and 1000…
# The most efficient way to find the number is to guess halfway between
# the low and high numbers of the range. If our guess is too big, then the
# answer lies between the bottom of the range and one less than our guess.
# If it is too small, then the answer lies between one more than our guess
# and the end of the range.
# Code this up. Your API will be guess(actual, range), where range is an Elixir
# range.
# Your output should look similar to:

# iex> Chop.guess(273, 1..1000)
# Is it 500
# Is it 250
# Is it 375
# Is it 312
# Is it 281
# Is it 265
# Is it 273
# 273

# Hints:
# – You may need to implement helper functions with an additional
#   parameter (the currently guessed number).
# – the div(a,b) function performs integer division
# – guard clauses are your friends
# – patterns can match the low and high parts of a range (a..b=4..8)


defmodule Chop do	
	def guess(_n, a..b) when a > b do
		IO.puts "Not FOUND!"
	end
	
	def guess(n, a..b) when n < div(b-a,2)+a do
		IO.puts "Is it #{(div(b-a,2)+a)}?"
		guess(n,a..(div(b-a,2)+a-1))
	end

	def guess(n, a..b) when n > div(b-a,2)+a do
		IO.puts "Is it #{div(b-a,2)+a}?"
		guess(n,(div(b-a,2)+a+1)..b)
	end

	def guess(n, _) do
		IO.puts "Is it #{n}?"
		IO.puts "#{n}"
	end
	
end

Chop.guess(202, 100..201)