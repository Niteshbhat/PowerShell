$Folders = (Get-ChildItem 'D:\jenkin' -Recurse -Force | where {$_.name -eq 'logs' -or $_.name -eq 'jre' -or $_.name -eq 'jobs'})

foreach ($folder in $Folders) {

$RawSize = $folder | Get-ChildItem -Recurse -Force -File | Measure-Object -Property Length -Sum

#Format to two decimal places
"{0:N2}" -f ([int32]$RawSize.sum /1MB)

}