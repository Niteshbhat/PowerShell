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

Below is a template to test 2 sets of code.

#>

# Let me know if your code runs faster than mine.

$Data1 = (Measure-Command -Expression {
  #< Your Code Here >#
}).TotalSeconds
    
$Data2 = (Measure-Command -Expression {
  #< Your Code Here >#
}).Totalseconds
   
        
$String = @"
Test1 = $Data1
Test2 = $Data2
"@
    
    Write-Host $String -ForegroundColor Blue
    
    
    
    
    