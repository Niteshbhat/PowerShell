$files=(Get-Content -Path D:\log.txt)
Clear-Content -path D:\log.txt
$files | where-object {if($_ -ne ""){
Write-output "$_"`n | Out-File d:\log.txt -Append
}}