# ■■  SLIDE - Zero to Hero  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Jason's Intro  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Agenda  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Lab 1 - Accessing the Lab Environment  ■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Windows PowerShell Interfaces  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Lab 2 - PowerShell 7 Setup  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - What is Windows Terminal  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Lab 3 - Deploying Windows Terminal  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - The Syntax of PowerShell  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■


# The remainder of this workshop will be in PowerShell 7.
# PowerShell cmdlets have a Verb-SingularNoun Structure
Get-Verb

# PowerShell Verb List
Start-Process -FilePath "https://docs.microsoft.com/en-us/powershell/developer/cmdlet/approved-verbs-for-windows-powershell-commands"

# Let' run a few cmdlets
Get-Disk
Get-Volume

# Parameters are similar to DOS command switches. They modify the behavior
# of a cmdlet and let you provide input to the cmdlet.
IPConfig
IPConfig /DisplayDNS

Get-Date
Get-Date -Year 2018

# Let PowerShell Type for you ------------------------------------------------- 
# Place your cursor at the end of each line and 
# Press Ctrl TAB to active the intellisense.
Get-Ho
Get-Da
Get-Proc

# For TAB completion, place your cursor after the - and type Hi TAB
Get-hi

# For TAB completion, place your cursor after the - and type wine TAB
Get-WinEvent

# You can do the same for Parameters.
Get-Date -Y
Get-Process -N

# SLIDE - Asking for, and Getting Help
Get-Command -Noun Help

# Updateable Help 
# Where Update-Help looks for cmdlets and modules to update help on.
($env:PSModulePath).Split(";")
Update-Help -Verbose

# Additional Reading
Start-Process "http://mctexpert.blogspot.com/2016/01/how-to-read-help-files-part-1-of-7.html"

# Basic Help - These two commands do the same thing.
Get-Help -Name Get-Date
Get-Help Get-Date

# Additional Reading
Start-Process "http://mctexpert.blogspot.com/2016/01/how-to-read-help-files-part-2-of-7.html"
Start-Process "http://mctexpert.blogspot.com/2016/01/how-to-read-help-files-part-3-of-7.html"

# Detailed Help
Get-Help Get-Date -Detailed

# Additional Reading
Start-Process "http://mctexpert.blogspot.com/2016/01/how-to-read-help-files-part-4-of-7.html"

# Full Help
Get-Help Get-Date -Full

# Additional Reading
Start-Process "http://mctexpert.blogspot.com/2016/01/reading-help-files-part-5-of-7.html"

# Show Window ( Note: This parameter is not supported in PSv7.  It is available in PSv3 - PSv5.1)
Get-Help Get-Date -ShowWindow

# Online Help
Get-Help Get-Date -Online

# Help on individual parameters
Get-Help Get-Date -Parameter Day

# Examples only
Get-Help Get-Date -Examples

# Additional Reading
Start-Process "http://mctexpert.blogspot.com/2016/01/how-to-read-help-files-part-6-of-7.html"

# Conceptual Help Files
Get-Help About_*
Get-Help About_IF

# Additional Reading
Start-Process "http://mctexpert.blogspot.com/2016/01/how-to-read-help-files-part-7-of-7.html"


# ■■  SLIDE - Working With Objects  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - What is a Property - Cars  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - What is a Property - Glasses  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - What is a Property?  Type: User  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■


Get-ADUser -Filter {Name -eq "Jill Styles" -or Name -eq "Mike Benton"} -Properties Office, Department | 
Select-Object -Property GivenName, Surname, Office, Department


# ■■  SLIDE - Type: EventLog Record  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

Get-WinEvent -ProviderName PowerShell


# ■■  SLIDE - Seeing All the Information  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

Get-WinEvent -ProviderName PowerShell | Get-Member

Get-WinEvent -ProviderName PowerShell | Select-Object -First 1 -Property *

Get-WinEvent -ProviderName PowerShell | Select-Object -Property RecordID, TaskDisplayName, TimeCreated

Get-Help Select-Object -Online

# ■■  SLIDE - Lab 4 - Discovering Objects  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■


# ■■  SLIDE - Master the Pipeline  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
Get-Volume

Get-Volume | Get-Member

# To discover what each property means, perform a search for the TYPENAME: MSFT_Volume
Start-Process -FilePath 'https://docs.microsoft.com/en-us/previous-versions/windows/desktop/stormgmt/msft-volume' 


# ■■  SLIDE - Using Select-Object to See Everything  ■■■■■■■■■■■■■■■■■■■■■■■■■■

Get-Volume | Select-Object -Property *


# ■■  SLIDE - Using Select-Object to get Only What You Want  ■■■■■■■■■■■■■■■■■■

Get-Volume | Select-Object -Property DriveLetter, FileSystem, Size


# ■■  SLIDE - Lab 5: Selecting the Data You Want  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■


# ■■  SLIDE - Using the PowerShell Pipeline ByValue  ■■■■■■■■■■■■■■■■■■■■■■■■■■

Get-Help Get-Service -Online

# ■■  SLIDE - Passing ByValue  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

'Bits', 'Winrm' | Get-Service


# ■■  SLIDE - Lab 6: Pass information ByValue  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

Get-Help New-ADUser -Online

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

Get-PipelineInfo -Cmdlet New-ADUser

# Filter the results so you can see how many parameters
# accept pipeline input ByPropertyName.

Get-PipelineInfo -Cmdlet New-ADUser | Where-Object ByPropertyName -eq $True | Measure-Object


# ■■  SLIDE - Passing ByPropertyName  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

#region - Build a CSV for New-ADUser
# Run the code below to create a CSV file containing the information that we will need

New-Item -Path C: -Name PSAsia -ItemType Directory
$FileData = @'
"GivenName", "Surname", "SamAccountName", "DisplayName", "Name", "Description" 
"Milton", "Goh", "MiltonGoh", "Milton Goh", "Milton", "Microsoft CDM MVP" 
"Sebastian", "Szumigalski", "SebastianSzumigalski", "Sebastian Szumigalski", "Sebastian", "Microsoft CDM MVP"
"Jaap", "Brasser", "JaapBrasser", "Jaap Brasser", "Jaap", "Cloud and Automation Engineer and CDM MVP"
"Gael", "Colas", "GaelColas", "Gael Colas", "Gael", "Cloud and Automation consultant"
"Ravikanth", "Chaganti", "RavikanthChaganti", "Ravikanth Chaganti", "Ravikanth", "automation fanatic"
"Chendrayan", "Venkatesan", "ChendrayanVenkatesan", "Chendrayan Venkatesan", "Chendrayan", "automation enthusiast"
"Prateek", "Singh", "PrateekSingh", "Prateek Singh", "Prateek", "Infrastructure developer"
"Ajay", "Kakkar", "AjayKakkar", "Ajay Kakkar", "Ajay", "Microsoft Most Valuable Professional"
"Alok", "Agrawal", "AlokAgrawal", "Alok Agrawal", "Alok", "technology evangelist"
"Senthamil", "Selvan", "SenthamilSelvan", "Senthamil Selvan", "Senthamil", "Microsoft Windows Dev MVP."
'@

$FileData | Out-File -FilePath c:\PSAsia\NewUsers.csv

#endregion - Build a CSV for New-ADUser ---------------------------------------

# Read the CSV file into the pipeline
Import-Csv -Path C:\PSAsia\NewUsers.csv

# Verify that you are working with objects
Import-Csv -Path C:\PSAsia\NewUsers.csv | Get-Member

# ■■  SLIDE - Lab 7: Pas information ByPropertyName  ■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Going Beyond Cmdlets  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - How CIM is Organized  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# List all Namesspaces in the Root
Get-CimInstance -Namespace Root -ClassName __Namespace

# List all classes in the Root/CIMv2 Namespace
Get-CimClass

# List all classes in the Root/Hardware Namespace
Get-CimClass -Namespace root/Hardware

# List all Drive Objects using WMI and CIM
Get-CIMInstance -ClassName Win32_LogicalDisk

# SLIDE - Documentation
Get-CimInstance -ClassName Win32_LogicalDisk | Get-Member

# Perform a search for Win32_LogicalDisk to read the documentation
Start-Process -FilePath 'https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-logicaldisk'


# ■■  SLIDE - Filtering the Results  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object DriveType -eq 3

Get-Help Where-Object -Online
Get-Help about_Comparison_Operators 

# ■■  SLIDE - Lab 8: CIM  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Writing faster code.  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# ■■  SLIDE - Pipeline vs. Dot Notation  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
Clear-Host

$Files = Get-ChildItem -Path c: -Force -Recurse | Select-Object -First 1

Write-Host "Looking at only parameter binding information" -ForegroundColor Yellow
Write-Host "Using the pipeline ---------------------------" -ForegroundColor Green
Trace-Command -name ParameterBinding -PSHost -Expression {
    $Files | Select-Object -ExpandProperty name 
    }

Write-Host
Write-Host "Not using the pipeline -----------------------" -ForegroundColor Magenta
Trace-Command -name ParameterBinding -PSHost -Expression {
    $Files.Name 
    }

# List all of the trace sources on your node.
Get-TraceSource

# Get a list of all trace sources

$Sources = Get-TraceSource | Select-Object -ExpandProperty Name
$Sources

Clear-Host
Write-Host "Looking at all trace sources" -ForegroundColor Yellow
Write-Host "Using the pipeline with all trace sources ----" -ForegroundColor Green
Trace-Command -name $Sources -PSHost -Expression {
    $Files | Select-Object -ExpandProperty name 
    }

Write-Host
Write-Host "Not using the pipeline with all trace sources -" -ForegroundColor Magenta
Trace-Command -name $Sources -PSHost -Expression {
    ($Files).Name 
    }

# Get 1000 files.
$Files = Get-ChildItem -Path c: -Force -Recurse | Select-Object -First 1000

$Test1 = (Measure-Command -Expression {$Files | Select-Object -ExpandProperty name } ).TotalSeconds
$Test2 = (Measure-Command -Expression {($Files).Name } ).TotalSeconds

$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
"@

Write-Host $TestResults -ForegroundColor Blue

# ■■  SLIDE - Where Method  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# Get 10000 files.
$Files = Get-ChildItem -Path c: -Force -Recurse | Select-Object -First 10000

# Traditional use of Where-Object
$Files | Where-Object {$_.Length -gt 2MB}

# Where Method
$Files.Where{$_.Length -gt 2MB}

# Speed Test - Where-Object vs. Where Method
$Test1 = (Measure-Command -Expression {$Files | Where-Object {$_.Length -gt 2MB} } ).TotalSeconds
$Test2 = (Measure-Command -Expression {$Files.Where{$_.Length -gt 2MB} } ).TotalSeconds
$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
$((($Test1/$Test2)).ToString("#.##"))x Faster
"@

Write-Host $TestResults -ForegroundColor Blue

# Option: First - Stop processing after the first match. ----------------------
$Files | Where-Object {$_.Length -gt 2MB} | Select-Object -First 1
$Files.Where({$_.Length -gt 2MB}, 'First')

# Speed Test - First
$Test1 = (Measure-Command -Expression {$Files | Where-Object {$_.Length -gt 2MB} | Select-Object -First 1 } ).TotalSeconds
$Test2 = (Measure-Command -Expression {$Files.Where({$_.Length -gt 2MB}, 'First') } ).TotalSeconds
$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
$((($Test1/$Test2)).ToString("#.##"))x Faster
"@

Write-Host $TestResults -ForegroundColor Blue

# Option: Last - Returns the last matching object. ----------------------------
$Files | Where-Object {$_.Length -gt 2MB} | Select-Object -Last 1
$Files.Where({$_.Length -gt 2MB}, 'Last')

# Speed Test - Last
$Test1 = (Measure-Command -Expression {$Files | Where-Object {$_.Length -gt 2MB} | Select-Object -Last 1 } ).TotalSeconds
$Test2 = (Measure-Command -Expression {$Files.Where({$_.Length -gt 2MB}, 'Last') } ).TotalSeconds
$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
$((($Test1/$Test2)).ToString("#.##"))x Faster
"@

Write-Host $TestResults -ForegroundColor Blue

# Option: SkipUntil -Skip until the condition is true, then return the rest.. -
$Files | ForEach-Object -Begin {$Skip = $True} `
                   -Process {
                    If ($Skip) {
                         If ($_.Length -gt 2MB) {$Skip = $False}
                     }
                    If ($Skip -EQ $False) {
                        Write-Output $_ 
                    }
                   } | Measure-object

$Files.Where({$_.Length -gt 2MB}, 'SkipUntil') | Measure-Object

# Speed Test - SkipUntil
$Test1 = (Measure-Command -Expression {$Files | ForEach-Object -Begin {$Skip = $True} `
-Process {
 If ($Skip) {
      If ($_.Length -gt 2MB) {$Skip = $False}
  }
 If ($Skip -EQ $False) {
     Write-Output $_ 
 }
}  } ).TotalSeconds
$Test2 = (Measure-Command -Expression {$Files.Where({$_.Length -gt 2MB}, 'SkipUntil') } ).TotalSeconds
$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
$((($Test1/$Test2)).ToString("#.##"))x Faster
"@

Write-Host $TestResults -ForegroundColor Blue

# Option: Split - Return an array of two elements, first index is matched elements, second index is the remaining elements.
$Files | ForEach-Object -Begin {$ObjectsTrue = @() ; $ObjectsFalse = @()} -Process {
    If ($_.Length -gt 2MB) { $ObjectsTrue += $_}
    Else { $ObjectsFalse += $_}
    }

# Results
($ObjectsTrue | Measure-Object).Count
($ObjectsFalse | Measure-Object).Count

$ObjectsTrue, $ObjectsFalse = $Files.Where({$_.Length -gt 2MB}, 'Split')

# Results
($ObjectsTrue | Measure-Object).Count
($ObjectsFalse | Measure-Object).Count

# Speed Test - Split
$Test1 = (Measure-Command -Expression {$Files | ForEach-Object -Begin {$ObjectsTrue = @() ; $ObjectsFalse = @()} -Process {
    If ($_.Length -gt 2MB) { $ObjectsTrue += $_}
    Else { $ObjectsFalse += $_}
    } } ).TotalSeconds
$Test2 = (Measure-Command -Expression {$ObjectsTrue, $ObjectsFalse = $Files.Where({$_.Length -gt 2MB}, 'Split') } ).TotalSeconds
$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
$((($Test1/$Test2)).ToString("#.##"))x Faster
"@

Write-Host $TestResults -ForegroundColor Blue

# Option: Unitl - Return elements until the condition is true then skip the rest. -
$Files | ForEach-Object -Begin {$ProcessObjects = $True} `
                        -Process { If ($_.Length -gt 2MB) {$ProcessObjects = $False}
                                If ($ProcessObjects) {Write-Output $_}
                                   

        } | Measure-Object
$Files.Where({$_.Length -gt 2MB}, 'Until') | Measure-Object

# Speed Test - Until
$Test1 = (Measure-Command -Expression {$Files | ForEach-Object -Begin {$ProcessObjects = $True} `
-Process { If ($_.Length -gt 2MB) {$ProcessObjects = $False}
        If ($ProcessObjects) {Write-Output $_}
           

}}  ).TotalSeconds
$Test2 = (Measure-Command -Expression {$Files.Where({$_.Length -gt 2MB}, 'Until') } ).TotalSeconds
$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
$((($Test1/$Test2)).ToString("#.##"))x Faster
"@

Write-Host $TestResults -ForegroundColor Blue


# ■■  SLIDE – ForEach Method  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
$Files = Get-ChildItem -Path c: -Force -Recurse -Directory| ForEach-Object -MemberName GetFiles -ErrorAction SilentlyContinue

# ForEach Statement
ForEach ($File in $Files[0..5]) { $File.Name }

# ForEach-Object cmdlet
$Files[0..5] | ForEach-Object -MemberName Name

# Call the value of the object’s property.
$Files[0..5].ForEach('Name')

# Call a method.
$Files[0..5].ForEach('ToString')

# Speed Test - ForEach Method
$Test1 = (Measure-Command -Expression {$Data1 = ForEach ($File in $Files) { $File.Name } } ).TotalSeconds
$Test2 = (Measure-Command -Expression {$Data2 = $Files | ForEach-Object -MemberName Name } ).TotalSeconds
$Test3 = (Measure-Command -Expression {$Data3 = $Files.ForEach('Name') } ).TotalSeconds
$TestResults = @"
Test1 Result: $Test1
Test2 Result: $Test2
Test3 Result: $Test3

ForEach Statement vs. ForEach Method
$((($Test1/$Test3)).ToString("#.##"))x Faster

ForEach-Object Vs. ForEach Method
$((($Test2/$Test3)).ToString("#.##"))x Faster
"@

Write-Host $TestResults -ForegroundColor Blue

# ■■  SLIDE - ForEach-Object -Parallel  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# List the experimental features
Get-ExperimentalFeature

Get-help ForEach-Object -Online

# Enable the PSForEachObjectParallel feature.
Enable-ExperimentalFeature -Name PSForEachObjectParallel -Verbose

# Start a new terminal.
Get-CimInstance -ClassName CIM_Processor | Select-Object -Property NumberOfCores

Get-ChildItem -Path C:/Windows/System32/DriverStore -Recurse -ErrorAction SilentlyContinue | 
ForEach-Object -MemberName GetFiles -ErrorAction SilentlyContinue |
Measure-Object

$Test1 = (Measure-Command -Expression {
    $Sum1 = 0
    Get-ChildItem -Path C:/Windows/system32/DriverStore -Recurse -ErrorAction SilentlyContinue | 
    ForEach-Object {$Sum1 += $_.Length}
}).TotalSeconds

$Test2 = (Measure-Command -Expression {
    $Sum2 = 0
    Get-ChildItem -Path C:/Windows/System32/DriverStore -Recurse -ErrorAction SilentlyContinue | 
    ForEach-Object  -Parallel {$Sum2 += $_.Length} -ThrottleLimit 2
}).TotalSeconds

Write-Host "Test 1 Total Seconds: $Test1" -ForegroundColor Blue
Write-Host "Test 1 Sum Value: $Sum1" -ForegroundColor DarkBlue
Write-Host "Test 2 Total Seconds: $Test2" -ForegroundColor Green
Write-Host "Test 2 Sum Value: $Sum2" -ForegroundColor DarkGreen

(Measure-Command -Expression {
    $Sum = 0
    Get-ChildItem -Path C:/Windows/System32/DriverStore -Recurse -ErrorAction SilentlyContinue | ForEach-Object  -Parallel {$Sum += $_.Length} -ThrottleLimit 2
}).TotalSeconds
$Sum

<#
Thank you for attending this workshop.  

Please feel free to contact me for your future PowerShell Training needs.

Jason Yoder
Jason@MCTExpert.com
#>

