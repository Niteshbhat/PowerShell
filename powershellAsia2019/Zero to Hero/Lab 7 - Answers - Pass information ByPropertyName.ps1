# Lab 7 : Pass information ByPropertyName

# For this lab, make sure you have the Get-PipelineInfo cmdlet
# Loaded into memory.

#region - Get-PipelineInfo
Function Get-PipelineInfo {
    [CmdletBinding()]
    Param (
        [parameter(Mandatory=$true)]
        [String]
        $Cmdlet
    )
    
    Write-Verbose "Pipeline informaiton for $Cmdlet."
    (Get-Help $Cmdlet).Parameters.Parameter |
        Where-Object PipelineInput -ne "False" | 
        Select-Object -Property Name , 
            @{N = "ByValue" ; E = { If ($_.PipelineInput -Like "*ByValue*") {$True}
                                    Else {$False} }},
            @{N = "ByPropertyName" ; E = { If ($_.PipelineInput -Like "*ByPropertyName*") {$True}
                                            Else {$False} }},
            @{N = "Type"; E = {$_.Type.Name}}
    
    <#
    .SYNOPSIS
    Gets the pipeline information for cmdlets.
    
    .DESCRIPTION
    Reads the help files of PowerShell scripts and cmdlets and extracts the
    information on all parameters that accept information from the PowerShell
    pipeline.
    
    .PARAMETER Cmdlet
    The cmdlet you want to get pipeline information on.
    
    .EXAMPLE
    Get-PipelineInfo -Cmdlet 'Get-Process'
    
    name         pipelineInput         Type      Cmdlet     
    ----         -------------         ----      ------     
    ComputerName True (ByPropertyName) String[]  Get-Process
    Id           True (ByPropertyName) Int32[]   Get-Process
    InputObject  True (ByValue)        Process[] Get-Process
    Name         True (ByPropertyName) String[]  Get-Process
    
    .NOTES
    ===============================================================================
    == Cmdlet: Get-PipelineInfo                                                  ==
    == Author: Jason A. Yoder                                                    ==
    == Company: MCTExpert of Arizona                                             ==
    == Date: January 15, 2019                                                    ==
    == Copyright: All rights reserved.                                           ==
    == Version: 1.0.0.0                                                          ==
    == Legal: The user assumes all responsibility and liability for the usage of ==
    == this PowerShell code.  MCTExpert of Arizona, Its officers, shareholders,  ==
    == owners, and their relatives are not liable for any damages.  As with all  ==
    == code, review it and understand it prior to usage.  It is recommended that ==
    == this code be fully tested and validated in a test environment prior to    ==
    == usage in a production environment.                                        ==
    ==                                                                           ==
    == Does this code make changes: NO                                           ==
    ===============================================================================
    #>
    } # END: Function Get-PipelineInfo
    
#endregion - Get-PipelineInfo



# Exercise 1 :
# Your task is to create a number of new SMBShares.  You manager has provided a CSV file.

# Step 1 :
# Run the code below to build the CSV file ---------------------------------------------
$Data = @"
"Names","Path","Location"
"SMB1","C:\Windows","Indianapolis"
"SMB2","C:\Windows\System32","Phoenix"
"SMB3","C:\Windows","Munich"
"SMB4","C:\Windows\System32","Singapore"
"@

$Data | Out-File -FilePath C:\PSAsia\SMBData.csv
# --------------------------------------------------------------------------------------

# Step 2 : 
# Read the Detailed help file for Import-CSV.
Import-CSV -Path C:\psasia\SMBData.csv

# Step 3 :
# From what you learned in the help file (Look at the examples), import the CSV
# file from disk into the PowerShell pipeline.
Import-CSV -Path C:\psasia\SMBData.csv

# Step 4 :
# Pipe the CSV to Get-Member and take note of the property names.
Import-CSV -Path C:\psasia\SMBData.csv | Get-Member

# Step 5 :
# Using the cmdlet Get-PipelineInfo, determine if the CSV file has enough information
# for the mandatory parameters of New-SMBShare that will accept pipeline input
# ByPropertyName. If not, make the necessary changes to the CSV file to get it to work.
# You will need to read the full help file for New-SMBShare to determine which
# parameters are mandatory.

# You should see this on the screen when you are successful.
# 
# Name ScopeName Path                Description
# ---- --------- ----                -----------
# SMB2 *         C:\Windows\System32            
# SMB1 *         C:\Windows                     
# SMB4 *         C:\Windows\System32            
# SMB3 *         C:\Windows                     


Get-Help New-SmbShare -Full
Get-PipelineInfo -Cmdlet New-SmbShare

Import-csv -Path c:\PSAsia\SMBNames.csv | New-SMBShare


# Exercise 2:
# Your organization needs to deploy a large number of 
# Active Directory Organizational Units.  Management is providing
# a CSV file with details for each.  Your task is to make sure
# that the cmdlet New-ADOrganizationaUnit will accept the data.

# Step 1 :
# Run the code below to build the CSV file ---------------------------------------------
$Data = @"
"Names","DisplayNames","City","County","Description"
"DevOps"," DevOps Team"," Bangalore"," India"," Azure DevOps development team resources"
"Executives","Executive Officers","New Delhi","India"," Corporate Executive Team resources"
"Engineering","Engineering Team","Indianapolis","United States","Specialize engineering teams resources"
"Finance","Financial Management Team","Singapore","Singapore","Financial Team resoruces"

"@

$Data | Out-File -FilePath C:\PSAsia\NewOUData.csv
# --------------------------------------------------------------------------------------


# Step 2 :
# Read the full help and use Get-PipelineInfo to determine what parameters
# accept pipeline input ByPropertyName for New-ADOrganizationalUnit
Get-PipelineInfo -Cmdlet New-ADOrganizationalUnit
Get-Help New-ADOrganizationalUnit -Full

# Step 3 : 
# Determine if the CSV fill will work with New-ADOrganizationalUnit.  If so, execute it.
# If not, correct the file and then execute it.  If successful, you will not see any output.
# Add the -Verbose parameter to New-ADOrganizatoinalUnit to see the following information
# If you are successful.
#
# VERBOSE: Performing the operation "New" on target "OU=DevOps,DC=Adatum,DC=com".
# VERBOSE: Performing the operation "New" on target "OU=Executives,DC=Adatum,DC=com".
# VERBOSE: Performing the operation "New" on target "OU=Engineering,DC=Adatum,DC=com".
# VERBOSE: Performing the operation "New" on target "OU=Finance,DC=Adatum,DC=com".
#

Import-Csv -Path C:\PSAsia\NewOUData.csv | New-ADOrganizationalUnit -Verbose


 

