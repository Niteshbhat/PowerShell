# Domain Setup Code.

# --- Run this code at the command prompt ---
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
# -------------------------------------------



Get-WindowsCapability -Online |? {$_.Name -like "*RSAT*Active*" -and $_.State -eq "NotPresent"} | Add-WindowsCapability -Online


$First = "Alice","Beth","Carry","Derick","Ed","Frank","Gal","Hillary","Jill","Ken","Lance","Mike","Nick"
$Last = "Benton","Edwards","Higgs","Miller","Roberts","Styles","Windsor"

# Set the Groups
New-ADGroup -Name "HR" -GroupCategory Security -GroupScope Global 
New-ADGroup -Name "IT" -GroupCategory Security -GroupScope Global 
New-ADGroup -Name "Engineering" -GroupCategory Security -GroupScope Global 
New-ADGroup -Name "Devops" -GroupCategory Security -GroupScope Global 
New-ADGroup -Name "Accounting" -GroupCategory Security -GroupScope Global 
New-ADGroup -Name "Sales" -GroupCategory Security -GroupScope Global 

Foreach ($F in $First) {
    Foreach ($L in $Last) {
        

        # Set the Office.
        $OfficeNumber = Get-Random -Minimum 0 -Maximum 5
        Switch ($OfficeNumber) {
            0 {$Office = 'Miami'}
            1 {$Office = 'London'}
            2 {$Office = 'Indianapolis'}
            3 {$Office = 'New Delhi'}
            4 {$Office = 'Singapore'}
            5 {$Office = 'Sydney'}

        }
        
        # Set the Department
        $DepartmentNumber = Get-Random -Minimum 0 -Maximum 5
        Switch ($DepartmentNumber) {
            0 {$Department = 'HR'}
            1 {$Department = 'IT'}
            2 {$Department = 'Engineering'}
            3 {$Department = 'DevOps'}
            4 {$Department = 'Accounting'}
            5 {$Department = 'Sales'}

        }

        New-ADUser -GivenName $F -Surname $L -SamAccountName "$F$L" `
            -DisplayName "$F $L" -Name "$F $L" -Office $Office `
            -Department $Department -PassThru |
            ForEach-Object {
                $User = $_.SamAccountName
                Switch ($DepartmentNumber) {
                    0 { Add-ADGroupMember -Identity 'HR' -Members $User   }
                    1 { Add-ADGroupMember -Identity 'IT' -Members $User   }
                    2 { Add-ADGroupMember -Identity 'Engineering' -Members $User }
                    3 { Add-ADGroupMember -Identity 'DevOps' -Members $User }
                    4 { Add-ADGroupMember -Identity 'Accounting' -Members $User }
                    5 { Add-ADGroupMember -Identity 'Sales' -Members $User }
        
                }

            }
        

    
    }

}




# Set the two specific users for the slide presentation.
Get-ADUser -Filter {Name -like "*Jill Styles*"} | Set-ADUser -Office 'London' -Department 'IT'
Get-ADUser -Filter {Name -like "*Jill Styles*"} | Set-ADUser -Office 'Miami' -Department 'HR'
