function Write-Log($Message,$path,$Level)
{      
        if (Test-Path $Path) { 
            Write-Verbose "Log file $Path already exists" 
            Return 
            } 
        
        elseif (!(Test-Path $Path)) { 
            Write-Verbose "Creating $Path." 
            $NewLogFile = New-Item $Path -Force -ItemType File 
            }  
                
        $FormattedDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss" 
        switch ($Level) { 
            'Error' {                  
                $LevelText = '[ERROR:]' 
                } 
            
            'Info' { 
                
                $LevelText = '[INFO:]' 
                } 
            }         
       
        "$FormattedDate $LevelText $Message" | Out-File -FilePath $Path -Append
}

[string]$sourceDirectory = "d:\log1.txt"
[string]$destinationDirectory = "e:\log1.txt"
try{
Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory -ErrorAction stop
Write-Log -Message "File is Copyied Successfully" -Path "D:\log.txt" -Level "Info" -verbose
}
catch{
Write-Log -Message "$_" -Path  "D:\log.txt" -Level "Error" -verbose
}