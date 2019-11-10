# Lab 9 - Writing Faster Code
<#
Enumerate all files on the C: drive my calling the "GetFiles" method of the 
System.IO.DirectoryInfo object.  Next, filter them so you are only working 
with files that are larger than 5 MB.  Write the names of these files to a
text file called c:\PSAsia\Files.txt

Make your code as fast as possible. Use Measure-Command to time your code.

Remember, we talked about Where-Object, ForEach, Foreach-Object, 
Where Method and Foreach Method.  Which route will you choose?

If you pipe your output to "Measure-object", you should
get approximately 540 files.

Here is a template to compare two different possible answers.

$Dat12 = (Measure-Command -Expression {
    -- Put your code here --
}).Totalseconds

$Data2 = (Measure-Command -Expression {
    -- Put your code here --
}).Totalseconds
    

    
$String = @"
Test1 = $Data1"
Test2 = $Data2
"@

Write-Host $String -ForegroundColor Blue

#>

# Let me know if your code runs faster than mine.

$Data1 = (Measure-Command -Expression {
    ForEach ($Folder in (Get-ChildItem -path 'C:\'  -Directory -Recurse)) {
        ($Folder.GetFiles()).Where{$_.Length -gt 5MB} 
    }}).TotalSeconds
    
    $Data2 = (Measure-Command -Expression {
        ((Get-ChildItem -path 'C:\' -Directory -Recurse).ForEach('GetFiles')).ForEach({$_ | Where-Object Length -gt 5MB}) }).Totalseconds
    
    $Data3 = (Measure-Command -Expression {
        ((Get-ChildItem -path 'C:\' -Directory -Recurse).ForEach('GetFiles'))| ForEach-Object {($_ | Where-Object Length -gt 5MB) }
            }).Totalseconds
        
    
        
$String = @"
Test1 = $Data1
Test2 = $Data2
Test3 = $Data3
"@
    
    Write-Host $String -ForegroundColor Blue
    
    
    
    
    