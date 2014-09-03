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
# result to the sales tax function. Remember that the data should be formatted
# into a keyword list, and that the fields need to be the correct types (so
# the id field is an integer, and so on).
# You’ll need the library functions File.open, IO.read(file, :line), 
# and IO.stream(file).

