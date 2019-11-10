# Lab 5 - Selecting the data you want

# Exercise 1 - Discover the Object in the PowerShell Pipeline.

# Step 1:
# Run all three cmdlets you discovered in Lab 4, Exercise 1 and record the TypeName 
# of the Object by pipeing the object to Get-Member.
Get-PnpDevice | Get-Member
Get-ADcomputer -Filter * | Get-Member
Get-Uptime | Get-Member

# Step 2:
# Open the MSDN document describing the Object from the cmdelt Get-PnpDevice.
Start-Process -FilePath 'https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-pnpentity'

# Step 3:
# Open the MSDN document describing the Object from the cmdelt Get-ADComputer
Start-Process -FilePath 'https://docs.microsoft.com/en-us/dotnet/api/microsoft.activedirectory.management.adcomputer?view=activedirectory-management-10.0'

# Step 4:
# Open the MSDN document describing the Object from the cmdeltGet-Uptime
Start-Process -FilePath 'https://docs.microsoft.com/en-us/dotnet/api/system.timespan?view=netframework-4.8'

# Exercise 2 - Extracting the Values of an Object's Properties

# Step 1:
# Using the first webpage from Ex 1 Step 2, Extract the following.
# - The device name.
# - A property that will show the class of device.
# - Its current status
Get-PnpDevice | Select-Object -Property Name, PnPClass, Status


# Step 2:
# You Will need the Help file for the cmdlet discovered in Ex 1, Step 3.
# Get all computers in the domain.  Show only the properties for:
# - The computer name
# - When the computer account as created.
# - When the password was last set.
# - The primary group the computer is in.
Get-ADcomputer -Filter * -Properties Created, PasswordLastSet, PrimaryGroup | Select-Object -Property Name, Created, PasswordLastSet, PrimaryGroup

# Step 3:
# Using the documentation from the object produced by Get-Uptime, 
# Show only the hours, minutes, and seconds that this computer has been online.
Get-Uptime | Select-Object -Property Hours, Minutes, Seconds