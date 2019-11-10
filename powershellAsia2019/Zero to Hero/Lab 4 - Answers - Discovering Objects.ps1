# Lab 4 - Discovering Objects

# Setup:
# Execute the command below to set u the ability for you to 
# remotely manage other nodes in the network from this
# client.
Set-WSManQuickConfig -Force


# Exercise 1 - Discovering Cmdlets
# Hint: All of these will have the verb 'Get'
# Hint: Use Google.

# Step 1:
# Discover a cmdlet that will list all PnP Devices on this client.
Get-PnpDevice

# Step 2:
# Discover a cmdlet that will list all Computers in the Domain.
# Note: The cmdlet will not run by itself, we will run it in
#       exercise 2.
Get-ADComputer

# Step 3:
# Discover a cmdlet that will display the current uptime 
Get-Uptime

# Exercise 2 - Explore the help files for the cmdlets you discovered in 
#              exercise 1.

# Step 1: 
# Open the detailed help file for the cmdlet you discovered in Ex 1, Step 1.
Get-Help Get-PnpDevice -Detailed

# Step 2:
# Discover a parameter of the cmdlet that will allow you to get the
# PnP devices from the computer SVR1 and execute the command.
Get-PnpDevice -CimSession SVR1

# Step 3:
# Open the online help file for the cmdlet you discovered in Ex 1, Step 2.
Get-Help Get-ADComputer -Online

# Step 4:
# Using the help file for the cmdlet you discovered in Ex 1, Step 2
# get all the computers from Active Directory
Get-ADComputer -Filter *

# Step 5:
# Open the detailed help file for the cmdlet you discovered in Ex 1, Step 3.
Get-Help Get-Uptime -Detailed

# Step 6:
# Discover a parameter of the cmdlet that allows you to get a DateTime Object
# of when the system was last rebooted.
Get-Uptime -Since

# Exercise 3 - Going into more detail
# Step 1 :
# How many parameters of Get-PnPDevice accept multiple values?
# Answer : 5

# Step 2 :
# How many parameter sets does Get-PnPDevice have?
# Answer : 5


