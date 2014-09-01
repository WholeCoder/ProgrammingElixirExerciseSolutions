# Exercise: ModulesAndFunctions-7

# Find the library functions to do the following, and then use each in iex.
# (If there’s the word Elixir or Erlang at the end of the challenge, then you’ll
# find the answer in that set of libraries.)

# – Convert a float to a string with 2 decimal digits. (Erlang)
:io_lib.format("~.2f", [789.1234])

# – Get the value of an operating system environment variable. (Elixir)
System.get_env("PATH")

# – Return the extension component of a file name (so return .exs if given
# 	"dave/test.exs" (Elixir)
Path.extname("dave/test.exs")

# – Return the current working directory of the process. (Elixir)
System.cwd!()

# – Convert a string containing JSON into Elixir data structures. (Just
# find, don’t install)
	# https://github.com/cblage/elixir-json

# – Execute a command in your operating system’s shell
System.cmd("touch.exe",["test_file.txt"])
