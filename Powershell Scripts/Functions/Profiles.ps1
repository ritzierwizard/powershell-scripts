function Get-Profiles {
    foreach ($profileLocation in ($PROFILE | Get-Member -MemberType NoteProperty).Name) {
        Write-Host "$($profileLocation): $($PROFILE.$profileLocation)`n"
    }
}

function Get-CurrentProfile {
    Get-ChildItem -Path $PROFILE
}

