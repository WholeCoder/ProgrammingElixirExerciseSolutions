# Exercise: Nodes-3

# Alter the code so that successive ticks are sent to each registered 
# client (so the first goes to the first client, the second the next 
# client, and so on). Once the last client receives a tick, it 
# starts back at the first. The solution should deal with new clients 
# being added at any time.