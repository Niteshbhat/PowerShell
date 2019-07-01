
$result=@()
foreach ($name in $names.displayname)
{
$sam = get-aduser -filter {name -like $name} -properties * -ErrorAction silentlycontinue -errorvariable  adusererror
    if($adusererror -ne $null){   
        $hash=[PSCustomObject]@{
            Name = $name,
            GivenName=$null,
            SurName=$null,
            samAccountName=$null,
            eMailAddress=$null,
            error="Account is not Found"
            $result+=$hash
        }else {
            $hasherror=[PSCustomObject]@{
                Name = $sam.name,
                GivenName=$sam.GivenName,
                SurName=$sam.SurName,
                samAccountName=$sam.samAccountName,
                eMailAddress=$sam.eMailAddress,
                error=$null}
            $result+=$hasherror
        }
    }
    $adusererror=$null
}