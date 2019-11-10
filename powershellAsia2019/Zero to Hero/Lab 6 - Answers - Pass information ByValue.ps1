# Lab 6: Pass information ByValue


# Exercise 1 - Get-DNSClient

# Step 1:
# Execute the command Get-DNSClient
Get-DNSClient   

# Step 2: 
# Look at the full help file for Get-DNSClient for any parameter that accepts 
# Pipeline input ByValue.  Record the Parameter Name and expected
# DataType.
Get-Help Get-DnsClient -full

# Answer:
# InterfaceIndex - Integer

# Step 3:
# Attempt to pipe a comma seperated list of values to the cmdlet.  Use the values from
# Get-DNSClient to aid you in getting the IntefaceIndex numbers correct.
1, 4 | Get-DnsClient


# Exercise 2 - Get-Random

# Step 1 :
# Look at the help file for Get-Random for any parameter that accepts 
# Pipeline input ByValue.  Record the Parameter Name and expected
# DataType.
Get-Help Get-Random -Full

# Answer:
# InputObject - Object

# Step 2 :
# Execute a command that will give you all users from Active Directory.
Get-ADUser -Filter *

# Step 3 : 
# Attempt to get the cmdlet Get-Random to randomly select one of 
# those users by piping information to Get-Random.
Get-ADUser -Filter * | Get-Random

# Step 4 :
# Only show the GivenName, Surname, and SID for that object.
Get-ADUser -Filter *  | Get-Random | Select-Object -Property Givenname, Surname, SID


# Exercise 3  - Get-Timezone
# Step 1 :
# Look at the help file for Get-TimeZone for any parameter that accepts 
# Pipeline input ByValue.  Record the Parameter Name and expected
# DataType.
Get-Help Get-Random -Full

# Answer:
# Name - String

# Step 2 :
# Using your internet search skill set, find the names of at least 3
# valid time zones and pipe all three into Get-TimeZone using only
# 1 command line

# This will list all time zones. Use the StandardName.
[System.TimeZoneInfo]::GetSystemTimeZones()

'US Mountain Standard Time', 'Malay Peninsula Standard Time', 'AUS Central Standard Time'  | Get-timezone
