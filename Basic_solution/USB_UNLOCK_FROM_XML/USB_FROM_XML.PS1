$Base_DIR=(resolve-path .\).Path
$ddMMyyyy=(get-date).ToString('dd-MM-yyyy');
$LOG_DIR= $Base_DIR + "\LogFolder"
$LOG_File = $LOG_DIR + "\unlock"+ $ddMMyyyy + ".log"
$xml_config = "E:\github\PowerShell\USB_UNLOCK_FROM_XML\usbfromxml.XML"
[xml]$xml_content = Get-Content $xml_config

foreach($entity in $xml_content.GetElementsByTagName("DRIVE_NAME")){
$Drive = $entity.DRIVE_LETTER
Write-host "$Drive"
$serial = $entity.Serial_Number
Write-host "$serial"
$drive_serialnumber = Get-Partition -DriveLetter $Drive | Get-Disk | select-object -ExpandProperty SerialNumber
$drive_serialnumber.trim()

if($drive_serialnumber.trim() -like $serial){
.\unlock8gb.ps1
write-host "Drive succesfully unlocked"
}else {
.\Unlock64gb.ps1
write-host "Drive succesfully unlocked"
}

}