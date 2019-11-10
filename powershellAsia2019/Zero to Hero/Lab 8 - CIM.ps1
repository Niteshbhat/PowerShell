# Lab 8: CIM

# Exercise 1 : Determine the number of Processor Cores on a remote Node.

# Step 1: Discover a WMI or CIM class that allows you to get processor
# information.

# Answer:

# Step 2: Examine the online documentation for the class you discovered
#         in the previous step.  Determine the property names for:
#         -  32 or 64 bit processor.
#         -  Number of cores.

# Answer for 32 or 64 bit:  Architecture or DataWidth (This is preferred).  
# Answer for number of cores: NumberOfCores

# Step 3: Use Get-Ciminstance to get the processor information.


# Step 4: Filter the object to contain only the properties that you want.


# Step 5: Get this information from the node DC1. Hint: read the cmdlets help file.


# Exerise 2: Discover all running services on this client.

# Step 1: Discover a WMI or CIM class that allows you to see all services.
# Answer: 
# Step 2: Execute the class that you just discovered and observe the results.


# Step 3: Pipe the results to Where-Object and retain only the
# objects that represent services that are currently 'Running'.


# Exercise 3 : Getting display information
# Your task is to use a WMI/CIM class to recover the vertical and 
# horizontal screen resolution for DC1.  There are actually
# multiple WMI/CIM classes that could accomplish this task.
# The final answer must only have these two values.  You
# will complete this task using the PowerShell Pipeline.
